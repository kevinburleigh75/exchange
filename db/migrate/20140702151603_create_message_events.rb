class CreateMessageEvents < ActiveRecord::Migration
  def change
    create_table :message_events do |t|
      t.event
      t.string :message_id, null: false
      t.integer :in_reply_to_id
      t.text :to
      t.text :cc
      t.text :bcc
      t.text :subject
      t.text :body

      t.timestamps
    end

    add_event_index :message_events
    add_index :message_events, :message_id, unique: true
    add_index :message_events, :in_reply_to_id
  end
end
