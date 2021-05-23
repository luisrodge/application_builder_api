class ApplicationsController < ApplicationController
  before_action :set_application, only: %i[show]

  def show
    render(
      json: @application,
      include: ['sections', 'sections.rows', 'sections.rows.columns', 'sections.rows.columns.input']
    )
  end

  private

  def set_application
    @application = Application.find(params[:id])
  end
end
