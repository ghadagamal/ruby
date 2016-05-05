class AddBodColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :bod, :date
  end
end
