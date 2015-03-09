class AddLearnMomentImageToLearnMoments < ActiveRecord::Migration
  def up
    add_column :learn_moments, :image, :string
  end

  def down
  	remove_column :learn_moments, :image
  end
end
