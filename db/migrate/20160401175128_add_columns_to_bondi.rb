class AddColumnsToBondi < ActiveRecord::Migration
  def change
    add_column :bondis, :origin, :integer
    add_column :bondis, :destination, :integer
  end
end
