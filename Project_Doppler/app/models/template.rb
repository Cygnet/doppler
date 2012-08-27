class Template < ActiveRecord::Base
  attr_accessible :content, :id
  self.primary_key ="id"

  validates :id, :presence => true,
                 :uniqueness => true
end
