class CreateContracts < ActiveRecord::Migration[7.0]
  def change
    create_table :contracts do |t|
      t.references :customer, null: false, foreign_key: true
      t.references :tool_number, null: false, foreign_key: true

      t.timestamps
    end
  end
end
