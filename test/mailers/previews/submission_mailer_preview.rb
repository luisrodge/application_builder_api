# Preview all emails at http://localhost:3000/rails/mailers/submission_mailer
class SubmissionMailerPreview < ActionMailer::Preview
  def email_submission
    SubmissionMailer.email_submission(Submission.last)
  end
end
