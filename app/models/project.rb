class Project < ApplicationRecord
  belongs_to :user
  belongs_to :challenge
  mount_uploaders :image,ImageUploader

  serialize :image, JSON
end
