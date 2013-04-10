class CreateTestModel < ActiveRecord::Migration
  def up
    create_table :earthquakes do |t|
      t.string :source
    end
  end

  def down
    drop_table :earthquakes
  end
end
