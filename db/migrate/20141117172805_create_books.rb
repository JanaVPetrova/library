class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.references :user, index: true
      t.string :title
      t.string :author
      t.string :image
      t.text :description
      t.string :url

      t.timestamps
    end
  end
end
