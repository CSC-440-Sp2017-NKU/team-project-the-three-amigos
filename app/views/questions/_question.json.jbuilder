json.extract! question, :id, :forum_id, :body, :user_id, :created_at, :updated_at
json.url question_url(question, format: :json)