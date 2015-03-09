class RemoveBodyFromCompetency < ActiveRecord::Migration
  def change
    remove_column :competencies, :body, :string
  end
end
