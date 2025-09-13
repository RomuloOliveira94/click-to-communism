class AddSessionIdToClicks < ActiveRecord::Migration[8.0]
  def change
    add_column :clicks, :session_id, :string

    add_index :clicks, :session_id
    add_index :clicks, :ip_address
    add_index :clicks, [ :session_id, :created_at ]
  end
end
