class CompleteEarthquakesTable < ActiveRecord::Migration
  def up
    change_table :earthquakes do |t|
      t.remove :source
      t.string :eqid, :null => false, :default => ""
      t.index :eqid, :unique => true
      t.string :source, :null => false, :default => ""
      t.integer :version, :null => false, :default => 0
      t.datetime :datetime, :null => false, :default => Time.now
      t.decimal :latitude, :precision => 7, :scale => 4, :null => false, :default => 0
      t.decimal :longitude, :precision => 7, :scale => 4, :null => false, :default => 0
      t.decimal :magnitude, :precision => 2, :scale => 1, :null => false, :default => 0
      t.decimal :depth, :precision => 3, :scale => 2, :null => false, :default => 0
      t.integer :nst, :null => false, :default => 0
      t.string :region, :null => false, :default => ""
      t.timestamps
    end
  end

  def down
    change_table :earthquakes do |t|
      t.remove_columns :earthquakes, :eqid, :version, :datetime, :latitude, :longitude, :magnitude, :depth, :nst, :region
      t.remove_timestamps
    end
  end
end
