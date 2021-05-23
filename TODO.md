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

## Email submitted application PDF

For now the only way of recieving and viewing submitted applications will be via email. Once an application is submitted and a PDF has been generated for it, we will email that PDF to person who created the application.

We can use mailgun to send emails.