class CreateCarimages < ActiveRecord::Migration
  def self.up
    create_table :carimages do |t|
      t.integer :user_id
      t.integer :cargallery_id

      t.timestamps
    end
  end

  def self.down
    drop_table :carimages
  end
end
