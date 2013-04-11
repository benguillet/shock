class RemoveIndexColumnEqid < ActiveRecord::Migration
  def up
    remove_index :earthquakes, :column => :eqid
  end

  def down
    add_index :earthquakes, :eqid, :unique => true
  end
end
