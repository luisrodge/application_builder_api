class ApplicationsController < ApplicationController
  before_action :set_application, only: %i[show]
  before_action :should_404, only: :show

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

  def expand_short_url
    @application = Application.find_by_short_url(params[:short_url])
    render(json: @application.slug)
  end

  private

  def set_application
    @application = Application.friendly.find(params[:id])
  end

  def should_404
    render_404 unless @application.published?
  end
end
