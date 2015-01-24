class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.references :role, index: true

      t.timestamps null: false
    end
    add_foreign_key :users, :roles
  end
end
