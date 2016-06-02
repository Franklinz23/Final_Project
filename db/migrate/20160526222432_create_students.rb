class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :f_name
      t.string :l_name
      t.string :grade
      t.string :notes

      t.timestamps null: false
    end
  end
end
