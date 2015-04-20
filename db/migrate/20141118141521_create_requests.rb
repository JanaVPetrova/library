class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.references :user, index: true
      t.references :book, index: true
      t.string :workflow_state

      t.timestamps
    end
  end
end
