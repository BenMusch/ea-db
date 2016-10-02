class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.belongs_to :author, index: true, foreign_key: true
      t.belongs_to :subcategory, index: true, foreign_key: true
      t.string :url
      t.integer :upvotes, default: 0
      t.belongs_to :media_type, index: true, foreign_key: true
      t.string :title

      t.timestamps null: false
    end
  end
end
