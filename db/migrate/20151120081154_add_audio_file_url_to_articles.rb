class AddAudioFileUrlToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :audio_file_url, :text
  end
end
