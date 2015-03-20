class AddTimeStampsToLearnMoment < ActiveRecord::Migration
  def change
    add_column :learn_moments, :created_at, :datetime
    add_column :learn_moments, :updated_at, :datetime
  end
end
