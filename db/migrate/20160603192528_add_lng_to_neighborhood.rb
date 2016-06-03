class AddLngToNeighborhood < ActiveRecord::Migration
  def change
    add_column :neighborhoods, :lng, :decimal
  end
end
