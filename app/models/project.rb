class Project < ApplicationRecord
  belongs_to :user
  belongs_to :challenge

end

def count_word
  @hash = self.description.strip.downcase.split(/[^\w']+/).group_by(&:to_s).map{|w| {w[0]=>w[1].count}}
end
