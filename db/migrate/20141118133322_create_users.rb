class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :type
      t.string :photo
      t.string :location
      t.string :last_name
      t.string :first_name
      t.references :team, index: true

      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end
