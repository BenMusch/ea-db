class AddDifficultyToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :difficult, :integer
  end
end
