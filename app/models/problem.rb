class Problem < ActiveRecord::Base
  belongs_to :problem_type

  default_scope { order(problem_date: :desc, created_at: :desc) }
end
