# frozen_string_literal: true

class ChangeCustomersColumn < ActiveRecord::Migration[7.0]
  def change
    change_column :customers, :user_id, :integer, :null => true
  end
end
