class CreateAuthorings < ActiveRecord::Migration
  def change
    create_table :authorings do |t|
      t.integer :article_id
      t.integer :author_id

      t.timestamps null: false
    end
  end
end
