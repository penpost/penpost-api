class ChangeConnectionsToPals < ActiveRecord::Migration[6.1]
  def change
    rename_table :connections, :pals
  end
end
