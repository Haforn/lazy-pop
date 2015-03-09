class AddUserIdToCompetency < ActiveRecord::Migration
  def change
    add_column :competencies, :user_id, :integer
  end
end
