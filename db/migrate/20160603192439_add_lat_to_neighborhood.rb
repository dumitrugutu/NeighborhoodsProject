class AddLatToNeighborhood < ActiveRecord::Migration
  def change
    add_column :neighborhoods, :lat, :decimal
  end
end
