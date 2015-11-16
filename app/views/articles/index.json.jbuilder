json.array!(@articles) do |article|
  json.extract! article, :id, :source_url, :title, :text_content, :status
  json.url article_url(article, format: :json)
end
