require_relative 'discount_db'
class ItemPricing

  def calculate_item_price(item, quantity, price)
    @discount = DiscountDb::DISCOUNTS[item]
    @quantity = quantity
    @price = price

    @discount.nil? ? standard_price : apply_discount
  end

  private

  def apply_discount
    send @discount
  end

  def standard_price
    @price * @quantity
  end

  def two_for_one
    @quantity % 2 == 0 ? @price * (@quantity / 2) : standard_price
  end

  def half_price
    (@price / 2) * @quantity
  end

  def half_price_one_only
    ((@price / 2) + (@price) * (@quantity - 1))
  end

  def buy_three_one_free
    @quantity >= 3 ? @price * (@quantity - 1) : standard_price
  end

end