class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :challenges
  has_one :profile
  has_many :solutions
  after_create :blank_challenge

  def blank_challenge
    id = self.id
    @challenge =  Challenge.create(user_id: id)
  end
end
