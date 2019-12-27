class HomeController < ApplicationController
  def top
    @items = Item.all
    @items_month = []
    @cost_month = 0
    @items.each do |item|
      if item.date.month == Date.today.month
        @items_month.push(item)
        @cost_month += item.price
      end
    end

    @chart = {}
    group = Item.group(:category).sum(:price)
    group.each do |k,v|
      category_name = Category.find_by(id: k).name
      @chart[category_name] = v
    end
  end
end
