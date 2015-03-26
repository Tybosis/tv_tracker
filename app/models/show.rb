class Show < ActiveRecord::Base
  has_and_belongs_to_many :profiles
  serialize :episodes

  def playing_on?(first_date, second_date)
    first_date == second_date ? first_date : false
  end
end
