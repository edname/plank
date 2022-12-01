# frozen_string_literal: true

class CreateToolLists < ActiveRecord::Migration[7.0]
  def change
    create_table :tool_lists do |t|
      t.string :name
      t.text :body

      t.timestamps
    end
  end
end
