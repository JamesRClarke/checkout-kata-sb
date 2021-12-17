class ItemPricing

  def calculate_price(item, quantity, prices)
    @item = item
    @quantity = quantity
    @prices = prices

    apply_discounts
  end

  private

  def apply_discounts
    if @item == :apple || @item == :pear
      if (@quantity % 2 == 0)
        @prices[@item] * (@quantity / 2)
      else
        @prices[@item] * @quantity
      end
    elsif @item == :banana || @item == :pineapple
      if @item == :pineapple
        price = (@prices[@item] / 2)
        price += (@prices[@item]) * (@quantity - 1)
      else
        (@prices[@item] / 2) * @quantity
      end
    else
      @prices[@item] * @quantity
    end
  end

end