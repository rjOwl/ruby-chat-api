class CreateApplications < ActiveRecord::Migration[7.1]
  def change
    create_table :applications do |t|
      t.string :token, index = true, unique: true
      t.string :name
      t.integer :chats_count

      t.timestamps
    end
  end
end
