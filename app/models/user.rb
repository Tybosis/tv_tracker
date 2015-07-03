class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :profiles
  after_create :default_profile

  def default_profile
    @profile = Profile.create!(name: 'default profile', user_id: User.last.id)
  end
end
