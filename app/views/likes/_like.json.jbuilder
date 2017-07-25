json.success @result
json.action params[:action]
json.count @resource.likes_count
json.like_path like_article_likes_path(@resource)
json.unlike_path unlike_article_likes_path(@resource)
