class List < ActiveRecord::Base
  has_many :items
  attr_accessible :summary, :title
end
