class AddDetailUrlToBondi < ActiveRecord::Migration
  def change
    add_column :bondis, :detail_url, :string
  end
end
