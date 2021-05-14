class ApplicationsController < ApplicationController
  def index
    @applications = Application.order(created_at: :desc)
    render(json: @applications)
  end

  def show
    @application = Application.find(params[:id])
    render(json: @application, include: ['sections', 'sections.rows', 'sections.rows.columns'])
  end
end
