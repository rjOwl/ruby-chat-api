class Chat < ApplicationRecord
  belongs_to :application
  has_many :messages, dependent: :destroy
  validates :chat_number, presence: false, uniqueness: { scope: :application_id }
  validates :messages_count, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  
  before_create :set_chat_number # id of the chat
  after_create :increment_chats_count # number of chats created per app
  after_destroy :decrement_chats_count

  private

  def set_chat_number
    max_chat_number = application.chats.maximum(:chat_number) || 0
    self.chat_number = max_chat_number + 1
  end

  def increment_chats_count
    application.increment!(:chats_count)
  end

  def decrement_chats_count
    application.decrement!(:chats_count)
  end
end
