class ApplicationsPdfController < ActionController::Base
  before_action :set_application, only: %i[show]

  def show
    respond_to do |format|
      format.pdf do
      end
    end
  end

  private

  def set_application
    @application = Application.find(params[:id])
  end
end
