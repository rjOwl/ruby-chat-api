class MessagesController < ApplicationController
    before_action :set_application, :set_chat
    before_action :set_message, only: [:show, :destroy, :update]

  
    def index
      if params[:query].present?
        search_results = Message.search(params[:query], fields: [:body], where: { chat_id: @chat.id })
        @messages = search_results.map do |message|
          {
            body: message.body,
            message_number: message.message_number,
            created_at: message.created_at,
            updated_at: message.updated_at
          }
        end
      else
        @messages = @chat.messages
      end
  
      render json: @messages, :except=> [:chat_id, :id], status: :ok
    end

    def create
      @message = @chat.messages.build(message_params)
  
      if @message.save
        render json: @message, :except=> [:chat_id, :id], status: :created
      else
        render json: @message.errors, status: :unprocessable_entity
      end
    end
  
    def show
      render json: @message, :except=> [:chat_id, :id], status: :ok
    end

    def update
        if @message.update(message_params)
          render json: @message, :except=> [:chat_id, :id], status: :ok
        else
          render json:{ error: @message.errors }, status: :unprocessable_entity
        end
    end
    
    def destroy
        if @message.destroy
            render json:{ message: "Deleted Successfully!" }, status: :ok
        else
          render json:{ errorrrrrrr: @message.errors }, status: :unprocessable_entity
        end
    end

    private
  
    def set_application
        @application = Application.find_by(token: params[:application_token])
        render json: { error: "Application not found" }, status: :not_found unless @application
      end

    def set_chat
        @chat = @application.chats.find_by(chat_number: params[:chat_chat_number])
        render json: { error: "Chat not found" }, status: :not_found unless @chat
    end
    
    def set_message
        @message = @chat.messages.find_by(message_number: params[:message_number])
        render json: { error: "Message not found" }, status: :not_found unless @message
    end
     
    def message_params
      params.require(:message).permit(:body)
    end

end
  