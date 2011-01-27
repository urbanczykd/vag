class AddDescribeToCargalleries < ActiveRecord::Migration
  def self.up
    add_column :cargalleries, :describe, :text
  end

  def self.down
    remove_column :cargalleries, :describe
  end
end
