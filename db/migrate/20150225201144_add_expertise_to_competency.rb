class AddExpertiseToCompetency < ActiveRecord::Migration
  def change
    add_column :competencies, :expertise, :string
  end
end
