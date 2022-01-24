module Api
  module V1
    class Api::V1::SubmissionsController < ApplicationController
      def create
        result = CreateSubmission.call(params)
        if result.success?
          EmailSubmissionJob.perform_async(result.record.id)
          EmailApplicantJob.perform_async(result.record.id) if result.record.email.present?
          head(:ok)
        else
          render_422('Could not create submission')
        end
      end
    end
  end
end
