class AddIndexToUsers < ActiveRecord::Migration[5.0]
  def change
    add_index :users, :email, unique: true # use for uniqueness at the database level
  end
end
