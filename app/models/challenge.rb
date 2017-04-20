class Challenge < ApplicationRecord
  belongs_to :user
  has_many :solutions
  mount_uploader :challengeimage, ChallengeimageUploader
end
