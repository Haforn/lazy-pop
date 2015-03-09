class CreateLearnMoment < ActiveRecord::Migration
  def change
    create_table :learn_moments do |t|
    	t.string :title
      t.string :what_was_learned
      t.string :what_was_done
      t.string :reference
      t.integer :competency_id
    end
  end
end
