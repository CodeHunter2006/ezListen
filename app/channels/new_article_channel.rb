class NewArticleChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'new_article'
  end
end
