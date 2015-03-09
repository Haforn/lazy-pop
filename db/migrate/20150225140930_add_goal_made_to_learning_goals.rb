class AddGoalMadeToLearningGoals < ActiveRecord::Migration
  def change
    add_column :learning_goals, :goal_made, :boolean, :default => false
  end
end
