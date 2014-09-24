json.array!(@problem_types) do |problem_type|
  json.extract! problem_type, :id, :name
  json.url problem_type_url(problem_type, format: :json)
end
