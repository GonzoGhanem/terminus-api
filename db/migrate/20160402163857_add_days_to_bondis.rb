class AddDaysToBondis < ActiveRecord::Migration
  def change
    add_column :bondis, :days, :boolean, array:true, default: []
  end
end
