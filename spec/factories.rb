FactoryGirl.define do
    factory :earthquake do
      datetime "2013-04-15T03:19:07Z"
      depth 2.0
      eqid "71971470"
      latitude 38.7885
      longitude -122.7623
      magnitude 2.2
      nst 42
      region "Northern California"
      source "nc"
      version 1
    end
end
