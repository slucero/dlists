class Item < ActiveRecord::Base
  belongs_to :list
  attr_accessible :description, :weight
end
