json.extract! tweet, :id, :user_id, :declaration, :created_at, :updated_at
json.url tweet_url(tweet, format: :json)
