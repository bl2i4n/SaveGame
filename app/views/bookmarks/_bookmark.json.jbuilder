json.extract! bookmark, :id, :url, :topic_id, :created_at, :updated_at
json.url bookmark_url(bookmark, format: :json)
