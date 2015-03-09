class CreateLearningGoals < ActiveRecord::Migration
  def change
    create_table :learning_goals do |t|
      t.text :goal
      t.integer :competency_id
      
      t.timestamps
    end
  end
end
