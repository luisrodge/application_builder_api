class Api::V1::Admin::InputsController < ApplicationController
  before_action :set_input, only: %i[destroy]

  def create
    result = CreateInput.call(input_params, params)
    if result.success?
      render(json: result.record, include: %w[column checkbox_options radio_options])
    else
      render_422(result.record.errors)
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
