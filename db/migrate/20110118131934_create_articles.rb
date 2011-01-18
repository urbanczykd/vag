class CreateArticles < ActiveRecord::Migration
  def self.up
    create_table :articles do |t|
      t.string :title
      t.string :tag
      t.text :head
      t.text :body
      t.integer :position
      t.boolean :publish
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :articles
  end
end
