# TODOS

## Generate application PDF

Once an application is submitted we want to generate a PDF for it. The pdf should be generated in the same structure the application is rendered in the apply form.  

The pdf will be organized into two parts:

1 Header
  - Application title
  - Application details
  - Contact info
  - Date
  - Etc

2 Body
  - Sections
    - Rows
      - Columns
        - Filled input

### Dealing with Attachments (images, documents, etc)

For the sake of simplicity when generating a pdf, if one if the inputs is a file or image upload input - instead of rendering the image directly in the pdf we will instead add it as an attachment in the email.

For example:

Input: Driver license (photo upload input)
Attachment: driver_license.png

Input: Employment letter (document upload input)
Attachment: employment_letter.pdf

The in the pdf when we render the columns for the above input instead we will use the attachment name as the values within the column pointing to the actual input data (atachment):

Driver license: driver_license.png
Employment letter: employment_letter.pdf


## Email submitted application PDF

For now the only way of recieving and viewing submitted applications will be via email. Once an application is submitted and a PDF has been generated for it, we will email that PDF to person who created the application.

We can use mailgun to send emails.

An email will contain the following:

- Application PDF
- Attachments

## Quik Links

When someone is ready to publish their application and make it available to start receiving submissions
they will be given a Quik Link - a short and nice url pointing to their application that they can then share
on facebook, instagram, email, etc...

Example:

wwww.quikapply.com/someuniqueid
www.quikapply.com/2SqS5kk