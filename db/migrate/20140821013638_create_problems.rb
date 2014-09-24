class CreateProblems < ActiveRecord::Migration
  def change
    create_table :problems do |t|
      t.integer :problem_type_id
      t.date :problem_date
      t.text :info
      t.string :video_url
      t.integer :user_id
      t.float :latitude
      t.float :longitude
      t.string :location
      t.integer :up_votes, default: 0
      t.integer :down_votesm, default: 0
      t.timestamps
    end
  end
end
