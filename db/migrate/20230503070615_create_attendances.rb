class CreateAttendances < ActiveRecord::Migration[7.0]
  def change
    create_table :attendances do |t|
      t.references :user_id, null: false, foreign_key: true
      t.time :time_in
      t.time :time_out
      t.timestamps
    end
  end
end
