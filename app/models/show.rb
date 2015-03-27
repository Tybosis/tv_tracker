class Show < ActiveRecord::Base
  has_and_belongs_to_many :profiles
  serialize :episodes
end
