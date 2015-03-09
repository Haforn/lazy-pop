class CreateCompetencies < ActiveRecord::Migration
  def change
    create_table :competencies do |t|
      t.string :title
      t.string :body
      t.boolean :added, :default => false
      t.timestamps
    end
  end
end
