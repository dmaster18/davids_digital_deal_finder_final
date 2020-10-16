class Review < ApplicationRecord
  belongs_to :user
  belongs_to :item
  validates :item_id, :user_id, :title, :rating, presence: true
  validates_uniqueness_of :item_and_user_id #Prevents more than 1 review by same user

  def item_and_user_id
    "#{self.item_id}_#{self.user_id}".to_sym
  end

  def description?
    if self.description != nil && self.description != ""
      true
    else
      false
    end
  end

end
