class AddHoursToLearnMoment < ActiveRecord::Migration
  def change
    add_column :learn_moments, :hours, :integer
  end
end
