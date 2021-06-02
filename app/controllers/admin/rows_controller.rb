module Admin
  class RowsController < ApplicationController
    before_action :set_row, only: %i[update destroy]

    def create
      @row = Row.new(row_params)
      if @row.save
        render(json: @row, include: ['columns'])
      else
        render_422(@row.errors)
      end
    end

    def update
      if @row.update(row_params)
        render(json: @row)
      else
        render_422(@row.errors)
      end
    end

    def destroy
      @row.destroy
      head(:ok)
    end

    private

    def row_params
      params.require(:row).permit(:id, :num_of_cols, :section_id, :title, :details)
    end

    def set_row
      @row = Row.find(params[:id])
    end
  end
end
