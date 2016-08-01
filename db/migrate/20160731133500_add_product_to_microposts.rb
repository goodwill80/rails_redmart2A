class AddProductToMicroposts < ActiveRecord::Migration[5.0]
  def change
    add_reference :microposts, :product, foreign_key: true
  end
end
