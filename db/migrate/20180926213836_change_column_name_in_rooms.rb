class ChangeColumnNameInRooms < ActiveRecord::Migration[5.2]
  def change
    rename_column :rooms, :status, :state
  end
end
