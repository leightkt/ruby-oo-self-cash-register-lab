require 'pry'

class CashRegister
    attr_accessor :total, :discount

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
        @prices = []
    end

    def add_item(title, price, quantity = 1)
        @items << {:title => title, :price => price, :quantity => quantity}
        @total += price * quantity
    end

    def items
        items_array = Array.new
        @items.map do |item|
            item[:quantity].times do
                items_array << item[:title]
            end
        end
        items_array
    end

    def apply_discount
        if @discount != 0
            @total -= ((@total * @discount.to_f) / 100).to_i
            return "After the discount, the total comes to $#{@total}."
        else return "There is no discount to apply."
        end
    end

    def void_last_transaction
        @items.pop
        @total = @items.reduce(0.0) do |sum, item|
            sum + (item[:price]*item[:quantity])
        end
    end

end

# binding.pry