class Review < ApplicationRecord
  belongs_to :user
  belongs_to :item
  validates :item_id, :user_id, :title, :rating, presence: true
  validates :item_and_user_id, uniqueness: true #Prevents more than 1 review by same user

  def item_and_user_id
    "#{self.item_id} #{self.user_id}"
  end

  def description?
    if self.description != nil && self.description != ""
      true
    else
      false
    end
  end

end
