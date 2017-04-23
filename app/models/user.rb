class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :challenges, dependent: :destroy
  has_one :profile
  has_many :solutions, dependent: :destroy

  has_many :challenges_with_solutions, :through => :solutions, :source => :challenge
end
