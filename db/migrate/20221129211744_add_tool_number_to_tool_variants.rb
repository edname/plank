class AddToolNumberToToolVariants < ActiveRecord::Migration[7.0]
  def change
    add_column :tool_variants, :tool_number, :string
  end
end
