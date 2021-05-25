class CreateInput < BaseService
  def initialize(input_params, params)
    @input_params = input_params
    @params = params
  end

  def call
    input = Input.new(@input_params)

    if input.save!

      create_checkbox_options(input.id) if input.input_type == 'CheckboxInput'
      Result.new(record: input, success: true)
    else

      Result.new(record: input, success: false)
    end
  end

  private

  def create_checkbox_options(input_id)
    @params[:checkbox_options].each do |option_name|
      CheckboxOption.create(name: option_name, input_id: input_id)
    end
  end
end
