require 'pry'

class Checkout
  attr_reader :prices
  private :prices

  def initialize(prices)
    @prices = prices
  end

  def scan(item)
    basket[item] += 1
  end

  def total
    total = 0
    basket.each do |item, quantity|
      if item == :apple || item == :pear
        if (quantity % 2 == 0)
          total += prices.fetch(item) * (quantity / 2)
        else
          total += prices.fetch(item) * quantity
        end
      elsif item == :banana || item == :pineapple
        if item == :pineapple
          total += (prices.fetch(item) / 2)
          total += (prices.fetch(item)) * (quantity - 1)
        else
          total += (prices.fetch(item) / 2) * quantity
        end
      else
        total += prices.fetch(item) * quantity
      end
    end
    total
  end

  private

  def basket
    @basket ||= Hash.new(0)
  end
end