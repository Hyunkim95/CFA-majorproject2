

class Challenge < ApplicationRecord
  after_create :find_topic
  belongs_to :user
  has_many :solutions
  serialize :tags
  validates :title, :description, :rules, :deadline, :presence => true
  mount_uploader :challengeimage, ChallengeimageUploader
  after_create :pre_project

  def find_topic
    require 'engtagger'

    topic = []

    tgr = EngTagger.new
    challenge_text = self.description.downcase
    c_tagged = tgr.add_tags(challenge_text)
    c_nouns = tgr.get_nouns(c_tagged).sort_by{|key, value| value}.reverse.to_h

    c_nouns.each do |word,value|
      if Tag.first.list.include? word
        topic << word
      elsif (word == c_nouns.first[0] && value > 1)
        topic << word
      end
    end

    self.update(tags: topic)
  end

  def pre_project
    challenge_words = self.tags
    Project.all.each do |project|
      count = 0
      project.tags.each do |word|
        if challenge_words.include? word
          count += 1
        end
      end

      if count > 0
          a = Solution.create(title:self.title, description: project.description, user_id: project.user.id, challenge_id:self.id, auto:true, image:project.image)
          print a
      end

    end
  end

end


def make_list(challenge, solution)
    require 'engtagger'

    tgr = EngTagger.new
    challenge_text = challenge.description.downcase
    solution_text = solution.description.downcase

    c_tagged = tgr.add_tags(challenge_text)
    s_tagged = tgr.add_tags(solution_text)

    c_nouns = tgr.get_nouns(c_tagged)
    s_nouns = tgr.get_nouns(s_tagged)

    #need to consider plurals

    #look for words that are the same
    c_nouns.each do |word,value|
      if s_nouns.include? word
        array = Tag.first.list
        array << word
        Tag.first.update(list: array)
      end
    end
end

def recommended_users(challenge)
  users = {}
  challenge.solutions.each do |solution|
    users[solution.user_id] = 0
  end

  challenge.tags.each do |tag|
    users.each do |user_id,key1arecre|
      count = 0
      User.find(user_id).tags.each do |key,value|
        if key == tag
          count += value
        end
      end
      users[user_id] += count
    end

    return users.sort_by{|k,v| v}
  end
end
