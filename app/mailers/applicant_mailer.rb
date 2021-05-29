class ApplicantMailer < ApplicationMailer
  def email_applicant(submission)
    @submission = submission

    attachment_name = "#{@submission.application.title.delete(' ').downcase}_submission.pdf"
    subject = "#{@submission.application.title} - Copy of Submission"

    attachments[attachment_name] = WickedPdf.new.pdf_from_string(
      render_to_string(
        'submissions/show.pdf.erb',
        layout: 'pdf.html'
      )
    )

    file_inputs = @submission.filled_inputs.where(input_type: 'UploadInput')

    if file_inputs.any?
      file_inputs.each do |file_input|
        file = file_input.file
        attachments[file.blob.filename.to_s] = { mime_type: file.blob.content_type, content: file.blob.download }
      end
    end

    mail(to: @submission.email, subject: subject)
  end
end
