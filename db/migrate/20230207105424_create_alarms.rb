class CreateAlarms < ActiveRecord::Migration[7.0]
  def change
    create_table :alarms do |t|
      t.integer :user_id
      t.string :alarm_start
      t.string :alarm_end
      t.integer :alarm_increment
      t.string :alarm_name
      t.boolean :is_disabled

      t.timestamps
    end
  end
end
