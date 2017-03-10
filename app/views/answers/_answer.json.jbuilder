json.extract! answer, :id, :answer_text, :date, :user_id, :created_at, :updated_at
json.url answer_url(answer, format: :json)