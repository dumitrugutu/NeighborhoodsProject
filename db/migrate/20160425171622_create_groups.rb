class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.references :neighborhood
      t.string :name
      t.string :website
      t.string :contact_info

      t.timestamps
    end
  end
end
