require 'pry'
class CashRegister
  attr_accessor :discount, :total  

  def  initialize(employee_discount = nil)
    @total = 0 
    @discount = employee_discount
    @items = []
    @last_transaction = []
  end 

  def add_item(title, price, quantity = 1) 
    @total = (price * quantity) + @total 
    @items += [title] * quantity
    @last_transaction = price * quantity
  end 

  def apply_discount
    if @discount
      discount_amount = @total * (@discount.to_f/100)
      @total -= discount_amount
      "After the discount, the total comes to $#{@total.to_i}."
    else 
      "There is no discount to apply."
    end 
  end 

  def items 
    @items 
  end 

  def void_last_transaction
    @total = @total - @last_transaction
    @total
  end 
end 
