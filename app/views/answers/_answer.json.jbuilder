json.extract! answer, :id, :question_id, :body, :user_id, :created_at, :updated_at
json.url answer_url(answer, format: :json)