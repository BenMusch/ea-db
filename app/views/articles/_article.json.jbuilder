json.extract! article, :id, :author_id, :subcategory_id, :url, :upvotes, :media_type_id, :title, :created_at, :updated_at
json.url article_url(article, format: :json)