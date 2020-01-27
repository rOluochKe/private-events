# frozen_string_literal: true

class CreateAttendances < ActiveRecord::Migration[5.2]
  def change
    create_table :attendances do |t|
      t.references :attendee
      t.references :attended_event

      t.timestamps
    end
    add_index :attendances, %i[attendee_id attended_event_id], unique: true
  end
end
