class AddFamilyAndTeacherRefToStudents < ActiveRecord::Migration
  def change
    add_column :students, :family_id, :integer
    add_column :students, :teacher_id, :integer
  end
end
