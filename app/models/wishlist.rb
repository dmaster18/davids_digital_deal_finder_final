class Wishlist < ApplicationRecord
  belongs_to :user
  has_many :wishlist_items
  has_many :items, through: :wishlist_items
  validates :user_id, :name, presence: true

  def no_description
    if self.description != nil && self.description != ""
      true
    else
      false
    end
  end

end
