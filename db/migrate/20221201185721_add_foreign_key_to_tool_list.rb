class AddForeignKeyToToolList < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :tool_lists, :tool_categories
  end
end
