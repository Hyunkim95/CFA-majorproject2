class Project < ApplicationRecord
  belongs_to :user
  belongs_to :challenge
  mount_uploaders :image,ImageUploader
  after_create :search_challenge

  serialize :image, JSON

  def count_word(input)
    array = input.description.strip.downcase.split(/[^\w']+/)
    fillers = ['the', 'as', 'on', 'in', 'to', 'because']

    fillers.each do |word|
      array.delete(word)
    end
    return array
  end

  def search_challenge
    p = count_word(self)
    Challenge.all.each do |challenge|
      c = count_word(challenge)
      count = 0

      p.each do |word|
        if c.include? word
          count += 1
        end
      end


      if count > 2
        Solution.create(description: self.description, user_id: self.user.id, challenge_id:challenge.id)
      end
    end
  end

end
