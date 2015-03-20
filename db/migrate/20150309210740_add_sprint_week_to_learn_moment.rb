class AddSprintWeekToLearnMoment < ActiveRecord::Migration
  def up
    add_column :learn_moments, :sprint_week, :integer
  end

  def down
  	remove_column :learn_moments, :sprint_week 
  end
end
