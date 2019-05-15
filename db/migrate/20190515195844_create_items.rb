class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :item
      t.string :price
      t.string :description
      t.string :reviews
      t.belongs_to :depts, foreign_key: true

      t.timestamps
    end
  end
end
