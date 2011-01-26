class AddContactsToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :gg, :integer
    add_column :users, :skype, :string
    add_column :users, :tlen, :string
    add_column :users, :yahoo, :string
  end

  def self.down
    remove_column :users, :gg
    remove_column :users, :skype
    remove_column :users, :tlen
    remove_column :users, :yahoo
  end
end
