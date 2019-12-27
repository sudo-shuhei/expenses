class HomeController < ApplicationController
  def top
    @items = Item.all
    @cost_month = 0
    @items.each do |item|
      puts item.date
      if item.date.month == Date.today.month
        # puts "今月"
        @cost_month += item.price
      end
    end
  end
end
