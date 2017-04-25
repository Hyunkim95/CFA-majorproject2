class User < ApplicationRecord
  rolify
  acts_as_messageable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :challenges, dependent: :destroy
  has_one :profile
  has_many :projects, dependent: :destroy
  has_many :solutions, dependent: :destroy
  serialize :tags
  has_many :challenges_with_solutions, :through => :solutions, :source => :challenge
  after_create :rolez
  after_create :add_name

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

  def rolez
    if self.role == "developer"
      self.add_role :developer
    elsif self.role == "business owner"
      self.add_role :business_owner
    elsif self.role == "admin"
      self.add_role :admin
    end
  end

  def add_name
    self.update(name: self.first_name + ' ' + self.last_name)
  end

  def mailboxer_name
  self.name
  end

  def mailboxer_email(object)
    self.email
  end
end
