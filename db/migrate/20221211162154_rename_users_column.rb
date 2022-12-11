# frozen_string_literal: true

class RenameUsersColumn < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :name, :username
  end
end
