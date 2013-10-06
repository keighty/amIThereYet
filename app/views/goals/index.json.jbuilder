json.array!(@goals) do |goal|
  json.extract! goal, :description, :motivation
  json.url goal_url(goal, format: :json)
end
