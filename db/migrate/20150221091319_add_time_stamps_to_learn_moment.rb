class AddTimeStampsToLearnMoment < ActiveRecord::Migration
  def change
    add_column :created_at, :datetime
    add_column :updated_at, :datetime
  end
end
