class Review < ApplicationRecord
  belongs_to :user
  belongs_to :item
  validates :item_id, :user_id, :title, :rating, presence: true
  validates :user_id, uniqueness: true

def description?
  if self.description != nil && self.description != ""
    true
  else
    false
  end
end
