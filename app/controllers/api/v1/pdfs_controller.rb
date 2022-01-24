module Api
  module V1
    class Api::V1::PdfsController < ActionController::Base
      def show
        @submission = Submission.find(params[:id])
        respond_to do |format|
          format.pdf do
            render(
              pdf: "submission_#{@submission.id}",
              template: 'submissions/show',
              layout: 'pdf.html',
              page_size: 'A4',
              show_as_html: params.key?('debug')
            )
          end
        end
      end
    end
  end
end
