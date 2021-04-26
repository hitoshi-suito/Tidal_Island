class CreateTides < ActiveRecord::Migration[5.2]
  def change
    create_table :tides do |t|
      t.integer :low_start_hour
      t.integer :low_start_min
      t.integer :low_start_second
      t.integer :low_end_hour
      t.integer :low_end_min
      t.integer :low_end_second
      t.integer :year
      t.integer :month
      t.integer :day

      t.timestamps
    end

    add_index :tides, [
      :low_start_hour,
      :low_start_min,
      :low_start_second,
      :low_end_hour,
      :low_end_min,
      :low_end_second,
      :year,
      :month,
      :day,
    ], unique: true, name: 'tides_unique_index'
  end
end
