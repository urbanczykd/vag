class CreateCargalleries < ActiveRecord::Migration
  def self.up
    create_table :cargalleries do |t|
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :cargalleries
  end
end
