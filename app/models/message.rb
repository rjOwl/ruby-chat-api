class Message < ApplicationRecord
  belongs_to :chat
  searchkick
  validates :body, presence: true
  validates :message_number, presence: false, uniqueness: { scope: :chat_id }

  before_create :set_message_number
  after_create :increment_messages_count
  after_destroy :decrement_messages_count

  private

  def set_message_number
    max_message_number = chat.messages.maximum(:message_number) || 0
    self.message_number = max_message_number + 1
  end

  def increment_messages_count
    chat.increment!(:messages_count)
  end

  def decrement_messages_count
    chat.decrement!(:messages_count)
  end

end
