json.extract! question, :id, :question_text, :date, :user_id, :forum_id, :created_at, :updated_at
json.url question_url(question, format: :json)