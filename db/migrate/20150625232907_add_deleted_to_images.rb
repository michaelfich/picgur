class AddDeletedToImages < ActiveRecord::Migration
  def change
    add_column :images, :deleted, :boolean, :default => false, :null => false
  end
end
