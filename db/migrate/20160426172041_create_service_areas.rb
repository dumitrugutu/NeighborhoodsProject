class CreateServiceAreas < ActiveRecord::Migration
  def change
    create_table :service_areas do |t|

      t.timestamps
    end
  end
end
