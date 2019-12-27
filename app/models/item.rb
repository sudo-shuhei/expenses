class Item < ApplicationRecord
  validates :price, presence: true
  validates :category, presence: true
  validates :date, presence: true
end
