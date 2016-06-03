class AddClassToUsers < ActiveRecord::Migration
  def change
    add_column :users, :class_name, :string
  end
end
