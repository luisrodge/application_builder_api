module Admin
  class InputsController < ApplicationController
    before_action :set_input, only: %i[destroy]

    def create
      @input = Input.new(input_params)
      if @input.save
        render(json: @input, include: ['column'])
      else
        render_422(@input.errors)
      end
    end

    def destroy
      @input.destroy
      head(:ok)
    end

    private

    def input_params
      params.require(:input).permit(:label, :required, :column_id, :input_type)
    end

    def set_input
      @input = Input.find(params[:id])
    end
  end
end
