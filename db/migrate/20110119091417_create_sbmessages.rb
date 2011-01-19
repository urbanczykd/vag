class CreateSbmessages < ActiveRecord::Migration
  def self.up
    create_table :sbmessages do |t|
      t.text :message
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :sbmessages
  end
end
