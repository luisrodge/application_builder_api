module Admin
  class SectionsController < ApplicationController
    before_action :set_section, only: %i[show update destroy]
    before_action :should_404, only: :show

    def show
      render(
        json: @section,
        include: [
          'application',
          'rows',
          'rows.columns',
          'rows.columns.input',
          'rows.columns.input.checkbox_options',
          'rows.columns.input.radio_options'
        ]
      )
    end

    def create
      @section = Section.new(section_params)
      if @section.save
        render(json: @section)
      else
        render_422(@section.errors)
      end
    end

    def update
      if @section.update(section_params)
        render(json: @section)
      else
        render_422(@section.errors)
      end
    end

    def destroy
      @section.destroy
      head(:ok)
    end

    private

    def section_params
      params.require(:section).permit(:id, :title, :details, :num_of_cols, :application_id)
    end

    def set_section
      @section = Section.find(params[:id])
    end

    def should_404
      render_404 if @section.application.published?
    end
  end
end
