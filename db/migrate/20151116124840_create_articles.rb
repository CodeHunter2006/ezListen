class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.text :source_url
      t.text :title
      t.text :text_content
      t.string :status

      t.timestamps null: false
    end
  end
end
