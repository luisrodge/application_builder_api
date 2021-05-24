class SubmissionsPdfController < ActionController::Base
  before_action :set_submission, only: %i[show]

  def show
    respond_to do |format|
      format.pdf do
        render(
          pdf: "submission_#{@submission.id}",
          template: 'submissions/show',
          layout: 'pdf.html',
          page_size: 'A4',
          show_as_html: params.key?('debug')
        )
      end
    end
  end

  private

  def set_submission
    @submission = Submission.find(params[:id])
  end
end
