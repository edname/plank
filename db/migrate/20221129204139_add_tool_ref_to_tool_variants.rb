class AddToolRefToToolVariants < ActiveRecord::Migration[7.0]
  def change
    add_belongs_to :tool_variants, :tool
  end
end
