json.extract! comment, :id, :body, :commentdate, :username, :post_id, :created_at, :updated_at
json.url comment_url(comment, format: :json)
