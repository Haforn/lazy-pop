class AddStudentNumberAndMobileToUser < ActiveRecord::Migration

  def up
  	add_column :users, :mobile, :string
  	add_column :users, :student_number, :integer
  end

  def down
  	remove_column :users, :student_number
  	remove_column :users, :mobile
  end
end


