json.array!(@submissions) do |submission|
  json.extract! submission, :id, :reps, :weight, :user_id
  json.url submission_url(submission, format: :json)
end
