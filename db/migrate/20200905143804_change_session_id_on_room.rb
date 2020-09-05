class ChangeSessionIdOnRoom < ActiveRecord::Migration[6.0]
  def change
    change_column :rooms, :session_id, :string
  end
end
