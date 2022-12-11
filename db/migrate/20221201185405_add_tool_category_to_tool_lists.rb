# frozen_string_literal: true

class AddToolCategoryToToolLists < ActiveRecord::Migration[7.0]
  def change
    add_reference :tool_lists, :tool_category
  end
end
