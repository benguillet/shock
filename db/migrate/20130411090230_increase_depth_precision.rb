class IncreaseDepthPrecision < ActiveRecord::Migration
  def up
    change_column :earthquakes, :depth, :decimal, :precision => 6, :scale => 2, :null => false, :default => 0
  end

  def down
    change_column :earthquakes, :depth, :decimal, :precision => 4, :scale => 2, :null => false, :default => 0
  end
end
