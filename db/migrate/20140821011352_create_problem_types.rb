class CreateProblemTypes < ActiveRecord::Migration
  def change
    create_table :problem_types do |t|
      t.string :name
    end
  end
end
