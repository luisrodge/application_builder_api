class ApplicationsController < ApplicationController
  def index
    @applications = Application.order(created_at: :desc)
    render json: @applications
  end
end
