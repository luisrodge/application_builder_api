class SubmissionMailer < ApplicationMailer
  def email_submission(submission)
    @submission = submission

    attachment_name = "#{@submission.application.title.delete(' ').downcase}_submission_#{@submission.id}.pdf"
    subject = "#{@submission.application.title} Submission No. #{@submission.id}"

    attachments[attachment_name] = WickedPdf.new.pdf_from_string(
      render_to_string(
        'submissions/show.pdf.erb',
        layout: 'pdf.html'
      )
    )

    mail(to: 'rodgetech@gmail.com', subject: subject)
  end
end
