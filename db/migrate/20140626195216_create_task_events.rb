class CreateTaskEvents < ActiveRecord::Migration
  def change
    create_table :task_events do |t|
      t.event
      t.string :task_id
      t.string :assigner_id
      t.datetime :due_date
      t.string :status

      t.timestamps
    end

    add_event_index :task_events
    add_index :task_events, :task_id
    add_index :task_events, :assigner_id
    add_index :task_events, :due_date
    add_index :task_events, :status
  end
end
