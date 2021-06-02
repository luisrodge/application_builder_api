class CreateSubmission < BaseService
  def initialize(params)
    @params = params[:submission]
  end

  def call
    submission = Submission.new(application_id: @params[:applicationId], email: @params[:email])
    begin
      ActiveRecord::Base.transaction do
        submission.save
        @params[:submissionSectionsAttributes].each do |section_params|
          submission_section = SubmissionSection.create(
            title: section_params[:title],
            details: section_params[:details],
            submission_id: submission.id
          )
          section_params[:submissionRowsAttributes].each do |row_params|
            submission_row = SubmissionRow.create(submission_section_id: submission_section.id)
            row_params[:submissionColumnsAttributes].each do |column_params|
              submission_column = SubmissionColumn.create(submission_row_id: submission_row.id)

              filled_input_params = column_params[:filledInputAttributes]
              input = Input.find(filled_input_params[:inputId])
              value = transform_value(input.input_type, filled_input_params)

              filled_input = FilledInput.create(
                label: input.label,
                value: value,
                input_type: input.input_type,
                input_id: input.id,
                submission_id: submission.id,
                submission_column_id: submission_column.id
              )
              attach_file(filled_input, filled_input_params) if input.input_type == 'UploadInput'
            end
          end
        end
      end
      Result.new(record: submission, success: true)
    rescue ActiveRecord::ActiveRecordError => e
      Result.new(record: submission, success: false, errors: e.message)
    end
  end

  private

  def transform_value(input_type, filled_input_params)
    return Time.parse(filled_input_params[:value]).strftime('%F') if input_type == 'DatePickerInput'
    return filled_input_params[:value].join(', ') if input_type == 'CheckboxInput'

    filled_input_params[:value]
  end

  def attach_file(filled_input, filled_input_params)
    file = filled_input_params[:file][:originFileObj]
    filled_input.file.attach(file)
  end
end
