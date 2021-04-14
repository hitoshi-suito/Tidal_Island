class CreateTides < ActiveRecord::Migration[5.2]
  def change
    create_table :tides do |t|
      t.time :low_start_at
      t.time :low_end_at
      t.time :current_time

      t.timestamps
    end
  end
end
