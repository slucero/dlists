class Item < ActiveRecord::Base
  belongs_to :list
  acts_as_list :scope => :list
  attr_accessible :description, :weight
end
