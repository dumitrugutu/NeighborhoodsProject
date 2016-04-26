class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.string :website
      t.string :contact_info
      t.string :address

      t.timestamps null: false
    end
  end
end
