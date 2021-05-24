class SubmissionsController < ApplicationController
  def create
    result = CreateSubmission.call(params)
    if result.success?
      EmailSubmissionJob.perform_async(result.record.id)
      head(:ok)
    else
      render_422('Could not create submission')
    end
  end
end
