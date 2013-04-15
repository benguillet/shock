class AddIndexLatitudeAndLongitude < ActiveRecord::Migration
  def up
    add_index :earthquakes, [:latitude, :longitude]
  end

  def down
    remove_index :earthquakes, [:latitude, :longitude]
  end
end
