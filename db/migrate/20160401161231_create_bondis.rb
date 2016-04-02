class CreateBondis < ActiveRecord::Migration
  def change
    create_table :bondis do |t|
      t.string :name
      t.datetime :departure
      t.datetime :arrival

      t.timestamps
    end
  end
end
