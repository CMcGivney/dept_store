class CreateDepts < ActiveRecord::Migration[5.2]
  def change
    create_table :depts do |t|
      t.string :business
      t.string :type
      t.string :phone
      t.string :email
      t.string :hours

      t.timestamps
    end
  end
end
