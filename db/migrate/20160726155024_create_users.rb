class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :telephone
      t.string :email
      t.string :address
      t.string :password
      t.integer :cc_number

      t.timestamps
    end
  end
end
