class CreateToolVariants < ActiveRecord::Migration[7.0]
  def change
    create_table :tool_variants do |t|
      t.text :body
      t.text :tool_number
      t.belongs_to :tool, null: false, foreign_key: true

      t.timestamps
    end
  end
end
