class CreateGalleries < ActiveRecord::Migration
  def self.up
    create_table :galleries do |t|
      t.string :name
      t.integer :user_id
      t.integer :article_id
      t.integer :position

      t.timestamps
    end
  end

  def self.down
    drop_table :galleries
  end
end
