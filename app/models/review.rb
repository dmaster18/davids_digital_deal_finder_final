class Review < ApplicationRecord
  belongs_to :user
  belongs_to :item
  validates :item_id, :user_id, :title, :rating, presence: true
end

def description?
  if self.description != nil && self.description != ""
    true
  else
    false
  end
end
