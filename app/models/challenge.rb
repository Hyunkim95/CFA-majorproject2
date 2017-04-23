class Challenge < ApplicationRecord
  belongs_to :user
  has_many :solutions, dependent: :destroy
  mount_uploader :challengeimage, ChallengeimageUploader
  after_create :pre_project

  def count_word(input)
    array = input.description.strip.downcase.split(/[^\w']+/)
    fillers = ['the', 'as', 'on', 'in', 'to', 'because']

    fillers.each do |word|
      array.delete(word)
    end
    return array
  end

  def pre_project
    challenge_words = count_word(self)
    Project.all.each do |project|
      count = 0

      count_word(project).each do |word|
        if challenge_words.include? word
          count += 1
        end
      end

      if count > 2
          Solution.create(description: project.description, user_id: project.user.id, challenge_id:self.id)
      end
    end
  end
end
