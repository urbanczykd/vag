class AddNameToCargallery < ActiveRecord::Migration
  def self.up
    add_column :cargalleries, :name, :string
  end

  def self.down
    remove_column :cargalleries, :name
  end
end
