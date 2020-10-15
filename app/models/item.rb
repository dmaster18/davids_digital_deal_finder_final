class Item < ApplicationRecord
  has_many :wishlist_items
  has_many :wishlists, through: :wishlist_items
  has_many :reviews
  validates :title, :sale_price, presence: true
  scope :purchased, -> { where(ordered: true) }

  def description?
    if self.description != nil && self.description != ""
      true
    else
      false
    end
  end

  def not_nil_or_zero(price_or_percentage)
    if price_or_percentage != 0 && price_or_percentage != nil
      true
    else
      false
    end
  end

  def creation_date_array
    whole_date_array = self.created_at.to_s.split(" ")
    #date_conversion(whole_date_array)
  end

  def update_date_array
    whole_date_array = self.updated_at.to_s.split(" ")
    #date_conversion(whole_date_array)
  end

  def convert_sale_price
    if self.sale_price.exists? && self.sale_price.include?("$")
      self.sale_price.to_s.delete("$").to_f
    elsif self.sale_price.exists?
      self.sale_price.to_f
    end
  end

  def convert_original_price
    if self.original_price.exists? && self.original_price.include?("$")
      self.original_price.to_s.delete("$").to_f
    elsif self.original_price.exists?
      self.original_price.to_f
    end
  end

  def calculate_sale_percentage
    if self.sale_percentage == "" || self.sale_percentage == nil && (self.sale_price != "" && self.sale_price != nil) && (self.original_price != "" && self.original_price != nil)
      self.sale_percentage = (self.original_price - self.sale_price)/self.original_price
      self.sale_percentage = "#{self.sale_percentage}%"
    else
      nil
    end
  end
end

#t.string :description
#t.float :original_price
#t.float :sale_percentage
#t.datetime :item_creation_date
#t.datetime :item_modification_date
#t.string :link
#t.string :retailer
#t.string :source
#t.boolean :active?
#t.integer :user_ranking
#t.boolean :ordered?
