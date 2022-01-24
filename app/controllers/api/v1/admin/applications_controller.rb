class Api::V1::Admin::ApplicationsController < ApplicationController
  before_action :set_application, only: %i[show update destroy publish quik_links]
  before_action :should_404, only: :show

  def index
    @applications = Application.order(created_at: :desc)
    render(json: @applications, include: [])
  end

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

  def create
    @application = Application.new(application_params)
    if @application.save
      render(json: @application)
    else
      render_422(@application.errors)
    end
  end

  def update
    @application.slug = nil
    if @application.update(application_params)
      render(json: @application)
    else
      render_422(@application.errors)
    end
  end

  def destroy
    @application.destroy
    head(:ok)
  end

  def publish
    @application.update(published: true)
    head(:ok)
  end

  def quik_links
    render(json: @application.apply_links)
  end

  private

  def application_params
    params.require(:application).permit(:id, :title, :email, :details, :policies, :terms, :signature_enabled)
  end

  def set_application
    @application = Application.friendly.find(params[:id])
  end

  def should_404
    render_404 if @application.published?
  end
end
