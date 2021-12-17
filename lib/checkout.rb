require 'pry'
require_relative 'item_pricing'

class Checkout < ItemPricing
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
    basket.map { |item, quantity| total += calculate_item_price(item, quantity, @prices[item]) }
    total
  end

  private

  def basket
    @basket ||= Hash.new(0)
  end
end