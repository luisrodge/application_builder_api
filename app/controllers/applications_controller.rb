class ApplicationsController < ApplicationController
  before_action :set_application, only: %i[show]

  def show
    render(
      json: @application,
      include: [
        'sections',
        'sections.rows',
        'sections.rows.columns',
        'sections.rows.columns.input',
        'sections.rows.columns.input.checkbox_options',
        'sections.rows.columns.input.radio_options'
      ]
    )
  end

  private

  def set_application
    @application = Application.find(params[:id])
  end
end
