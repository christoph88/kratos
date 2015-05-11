json.array!(@contests) do |contest|
  json.extract! contest, :id, :name, :description, :admin_id
  json.url contest_url(contest, format: :json)
end
