class CreateUsers < ActiveRecord::Migration[5.0]
  def change # determines a change to the overall db
    create_table :users do |t|
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
