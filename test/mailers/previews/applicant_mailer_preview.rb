# Preview all emails at http://localhost:3000/rails/mailers/applicant_mailer
class ApplicantMailerPreview < ActionMailer::Preview
  def email_applicant
    ApplicantMailer.email_applicant(Submission.last)
  end
end
