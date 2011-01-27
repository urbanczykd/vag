class AddPositionToCarimages < ActiveRecord::Migration
  def self.up
    add_column :carimages, :position, :integer
  end

  def self.down
    remove_column :carimages, :position
  end
end
