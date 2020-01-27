# frozen_string_literal: true

class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.date :date
      t.string :location
      t.text :description
      t.references :creator

      t.timestamps
    end
    add_index :events, [:date]
  end
end
