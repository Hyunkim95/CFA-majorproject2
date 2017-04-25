class Project < ApplicationRecord
  after_create :find_topic
  belongs_to :user
  belongs_to :challenge
  mount_uploaders :image,ImageUploader
  after_create :search_challenge
  validates :title, :description, :presence => true

  serialize :image, JSON
  serialize :tags

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

  def search_challenge
    project_tag = self.tags

    Challenge.all.each do |challenge|
      count = 0
      challenge.tags.each do |tag|
        if project_tag.include? tag
          count += 1
        end
      end

      if count > 0
        Solution.create(title:self.title, description: self.description, user_id: self.user.id, challenge_id: challenge.id, image:self.image, auto: true)
      end
    end
  end

end
