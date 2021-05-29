module Admin
  class ApplicationsController < ApplicationController
    before_action :set_application, only: %i[show destroy]

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

    def destroy
      @application.destroy
      head(:ok)
    end

    private

    def application_params
      params.require(:application).permit(:title, :email, :details)
    end

    def set_application
      @application = Application.friendly.find(params[:id])
    end
  end
end
