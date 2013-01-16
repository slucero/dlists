class List < ActiveRecord::Base
  has_many :items, :order => :position
  attr_accessible :summary, :title
end
