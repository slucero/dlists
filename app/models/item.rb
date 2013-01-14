class Item < ActiveRecord::Base
  belongs_to :list
  attr_accessible :description, :weight

  def url_for(options = {})
    super(options || {:id => id, :list_id => list_id})
  end
end
