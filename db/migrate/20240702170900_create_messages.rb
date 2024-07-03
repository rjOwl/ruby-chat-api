class CreateMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :messages do |t|
      t.text :body
      t.integer :message_number, index: true, unique: true
      t.references :chat, null: false, foreign_key: true

      t.timestamps
    end
  end
end
