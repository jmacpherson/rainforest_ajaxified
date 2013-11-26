class Product < ActiveRecord::Base
  has_many :reviews
  has_many :users, :through => :reviews
  validates_presence_of :name, :notice => "You must enter a name for this product."
  validates_presence_of :description, :notice => "You must enter a description for this product."
  validates_presence_of :price_in_cents, :notice => "You must enter a price in cents for this product."
  
  def format_price
    price_in_dollars = price_in_cents.to_f / 100
    sprintf("%.2f", price_in_dollars)
  end
end
