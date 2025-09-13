class CreateClicks < ActiveRecord::Migration[8.0]
  def change
    create_table :clicks do |t|
      t.string :ip_address
      t.string :user_agent

      t.timestamps
    end
  end
end
