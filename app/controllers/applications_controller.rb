class ApplicationsController < ApplicationController
  before_action :set_application, only: [:show, :update, :destroy]

  def index
    @applications = Application.all
    render json: @applications, :except=> [:id], status: :ok
  end

  def create
    token = SecureRandom.hex(10) # Generates a random token
    @application = Application.new(application_params.merge(token: token, chats_count: 0))

    if @application.save
      render json: { token: token }, status: :created
    else
      render json: @application.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: @application, :except=> [:id], status: :ok
  end

  def update
    if @application.update(application_params)
      render json: @application, :except=> [:id], status: :ok
    else
      render json: @application.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @application.destroy
    # head :no_content
      render json:{ message: "Deleted Successfully!" }, status: :ok
    else
      render json:{ error: @application.errors }, status: :unprocessable_entity

    end
  end

  private

  def set_application
    @application = Application.find_by(token: params[:token])
    render json: { error: "Application not found" }, status: :not_found unless @application
  end

  def application_params
    params.require(:application).permit(:name)
  end
end
