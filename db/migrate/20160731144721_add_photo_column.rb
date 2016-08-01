class AddPhotoColumn < ActiveRecord::Migration[5.0]
  def self.up
    add_column :products, :content_type, :string, :default => "image/png"
    execute 'ALTER TABLE products ADD COLUMN picture LONGBLOB'
  end

  def self.down
    remove_column :products, :content_type
    remove_column :products, :picture
  end


end
