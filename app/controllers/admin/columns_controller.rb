module Admin
  class ColumnsController < ApplicationController
    before_action :set_column, only: %i[destroy]

    def destroy
      @column.destroy
      @row.destroy if @row.columns.empty?
      head(:ok)
    end

    private

    def set_column
      @column = Column.find(params[:id])
      @row = @column.row
    end
  end
end
