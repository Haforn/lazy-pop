class AddPointsToCompetencies < ActiveRecord::Migration
  def change
    add_column :competencies, :points, :integer
  end
end
