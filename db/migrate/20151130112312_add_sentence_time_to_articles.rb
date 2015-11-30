class AddSentenceTimeToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :sentence_time, :text
  end
end
