class CreateToolNumbers < ActiveRecord::Migration[7.0]
  def change
    create_table :tool_numbers do |t|
      t.text :body
      t.integer :number
      t.belongs_to :tool_list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
