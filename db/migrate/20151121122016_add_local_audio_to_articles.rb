class AddLocalAudioToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :local_audio, :string
  end
end
