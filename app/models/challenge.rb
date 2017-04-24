

class Challenge < ApplicationRecord
  after_create :find_topic
  belongs_to :user
  has_many :solutions
  serialize :tags
  mount_uploader :challengeimage, ChallengeimageUploader
  after_create :pre_project



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
          Solution.create(description: project.description, user_id: project.user.id, challenge_id:self.id, auto:true)
      end

    end
  end

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
