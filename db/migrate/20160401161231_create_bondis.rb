class CreateBondis < ActiveRecord::Migration
  def change
    create_table :bondis do |t|
      t.string :name
      t.time :departure
      t.time :arrival

      t.timestamps
    end
  end
end
