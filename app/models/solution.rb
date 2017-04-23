class Solution < ApplicationRecord
  belongs_to :user
  has_many :challenges, through: :challenge_solutions

  mount_uploaders :image,ImageUploader

  serialize :image, JSON
end
