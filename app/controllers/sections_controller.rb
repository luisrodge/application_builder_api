class SectionsController < ApplicationController
  before_action :set_section, only: %i[show destroy]

  def show
    render(json: @section, include: ['application', 'rows', 'rows.columns'])
  end

  def create
    @section = Section.new(section_params)
    if @section.save
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
    params.require(:section).permit(:title, :details, :num_of_cols, :application_id)
  end

  def set_section
    @section = Section.find(params[:id])
  end
end
