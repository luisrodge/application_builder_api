class CreateSubmission < BaseService
  def initialize(params)
    @params = params
  end

  def call
    application = Application.find(@params[:application_id])
    submission = Submission.new(application_id: application.id)
    begin
      ActiveRecord::Base.transaction do
        submission.save

        application.sections.each do |section|
          submission_section = SubmissionSection.create(
            title: section.title,
            details: section.details,
            submission_id: submission.id
          )
          section.rows.each do |row|
            submission_row = SubmissionRow.create(submission_section_id: submission_section.id)
            row.columns.each do |column|
              submission_column = SubmissionColumn.create(submission_row_id: submission_row.id)

              input = column.input
              field_params = @params[:section_fields].find { |f| f[:name] == input.name }

              formatted_value = format_value(input.input_type, field_params[:value])

              FilledInput.create(
                label: input.label,
                value: formatted_value,
                input_type: input.input_type,
                input_id: input.id,
                submission_column_id: submission_column.id
              )
            end
          end
        end
        Result.new(record: submission, success: true)
      end
    rescue ActiveRecord::ActiveRecordError => e
      Result.new(record: submission, success: false, errors: e.message)
    end
  end

  private

  def format_value(input_type, value)
    return Time.parse(value).strftime('%F') if input_type == 'DatePickerInput'

    value
  end
end
