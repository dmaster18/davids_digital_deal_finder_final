class Review < ApplicationRecord
  belongs_to :user
  belongs_to :item
  validates :item_id, :user_id, :title, :rating, presence: true
  validates :user_id_user_id, uniqueness: true

  attr_accessor :item_id_user_id

  def item_id_user_id
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
