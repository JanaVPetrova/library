class CreateReadings < ActiveRecord::Migration
  def change
    create_table :readings do |t|
      t.string :workflow_state
      t.integer :progress
      t.references :book, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
