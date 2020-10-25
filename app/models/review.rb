class Review < ApplicationRecord
  belongs_to :user
  belongs_to :item
  validates :item_id, :user_id, :title, :rating, presence: true
  validates_uniqueness_of :item_id, scope: :user_id  #Prevents more than 1 review by same user

  def description?
    if self.description != nil && self.description != ""
      true
    else
      false
    end
  end

end
