class CreateFams < ActiveRecord::Migration
  def change
    create_table :fams do |t|

      t.timestamps null: false
    end
  end
end
