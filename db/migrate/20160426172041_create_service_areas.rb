class CreateServiceAreas < ActiveRecord::Migration
  def change
    create_table :service_areas do |t|
      t.integer :neighborhood_id
      t.integer :group_id

      t.timestamps null: false
    end
  end
end
