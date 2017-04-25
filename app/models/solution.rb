class Solution < ApplicationRecord
  belongs_to :user
  belongs_to :challenge
  validates :title, :description, :presence => true

  mount_uploaders :image,ImageUploader

  serialize :image, JSON
end
