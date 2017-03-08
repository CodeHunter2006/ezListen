class AddStickedToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :sticked, :boolean, default: false
  end
end
