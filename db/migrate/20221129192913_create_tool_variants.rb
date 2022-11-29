class CreateToolVariants < ActiveRecord::Migration[7.0]
  def change
    create_table :tool_variants do |t|
      t.text :body

      t.timestamps
    end
  end
end
