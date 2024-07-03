Rails.application.routes.draw do
  resources :applications, only: [:index, :create] do
    collection do
      get ':token', to: 'applications#show', as: 'show_by_token'
      put ':token', to: 'applications#update', as: 'update_by_token'
      delete ':token', to: 'applications#destroy', as: 'destroy_by_token'
    end
  end

  resources :applications, param: :token, only: [] do
    resources :chats, only: [:index, :create, :show, :destroy], param: :chat_number do
      resources :messages, only: [:index, :create, :show, :update, :destroy], param: :message_number do
      end

    end
  end

end
