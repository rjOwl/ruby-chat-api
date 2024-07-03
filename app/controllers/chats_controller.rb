class ChatsController < ApplicationController
    before_action :set_application
    before_action :set_chat, only: [:show, :destroy]

    def index
      @chats = @application.chats
      render json: @chats, :except=> [:application_id, :id], status: :ok
    end
  
    def create
      @chat = @application.chats.build(messages_count: 0)

      if @chat.save
        render json: @chat, :except=> [:application_id, :id], status: :ok
      else
        render json: @chat.errors, status: :unprocessable_entity
      end
    end
  
    def show
      render json: @chat, :except=> [:application_id, :id], status: :ok
    end

    def destroy
        if @chat.destroy
          render json:{ message: "Deleted Successfully!" }, status: :ok
        else
          render json:{ error: @chat.errors }, status: :unprocessable_entity
        end
      end
    
    private
  
    def set_application
      @application = Application.find_by(token: params[:application_token])
      render json: { error: "Application not found" }, status: :not_found unless @application
    end
  
    def set_chat
      @chat = @application.chats.find_by(chat_number: params[:chat_number])
      render json: { error: "Chat not found" }, status: :not_found unless @chat
  end

  end
  