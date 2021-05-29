class EmailApplicantJob
  include SuckerPunch::Job

  def perform(submission_id)
    ActiveRecord::Base.connection_pool.with_connection do
      submission = Submission.find(submission_id)
      ApplicantMailer.email_applicant(submission).deliver
    end
  end
end
