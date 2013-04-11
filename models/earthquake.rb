class Earthquake < ActiveRecord::Base
  validates_uniqueness_of :eqid
end
