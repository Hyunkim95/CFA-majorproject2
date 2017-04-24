class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :challenges, dependent: :destroy
  has_one :profile
  has_many :solutions, dependent: :destroy
  serialize :tags
  has_many :challenges_with_solutions, :through => :solutions, :source => :challenge

  def tag_user(object)
    if !object.tags.empty?
      tags = object.tags
      h = self.tags

      tags.each do |tag|
        if h.key?(tag)
          h[tag] += 1
        else
          h[tag] = 1
        end
      end

      self.update(tags: h)
    end
  end
end
