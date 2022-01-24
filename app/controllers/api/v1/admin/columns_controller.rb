class Api::V1::Admin::ColumnsController < ApplicationController
  before_action :set_column, only: %i[destroy]

  def create
    @column = Column.new(column_params)
    if @column.save
      render(json: @column)
    else
      render_422(@column.errors)
    end
  end

  def destroy
    @column.destroy
    @row.destroy if @row.columns.empty?
    head(:ok)
  end

  private

  def column_params
    params.require(:column).permit(:row_id, :section_id)
  end

  def set_column
    @column = Column.find(params[:id])
    @row = @column.row
  end
end
