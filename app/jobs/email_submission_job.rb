class EmailSubmissionJob
  include SuckerPunch::Job

  def perform(submission_id)
    ActiveRecord::Base.connection_pool.with_connection do
      submission = Submission.find(submission_id)
      SubmissionMailer.email_submission(submission).deliver
    end
  end
end
