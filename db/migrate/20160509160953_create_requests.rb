class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :text
      t.string :email
      t.date :request_date
      t.string :status

      t.timestamps
    end
  end
end
