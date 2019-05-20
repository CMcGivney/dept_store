class AddProductToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :product, :string
  end
end
