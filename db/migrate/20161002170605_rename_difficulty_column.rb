class RenameDifficultyColumn < ActiveRecord::Migration
  def change
    rename_column :articles, :difficult, :difficulty
  end
end
