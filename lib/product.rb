
class Product
 attr_reader :title, :stock, :price
 @@products = []

    def initialize(options={})
        @title = options[:title]
        @stock = options[:stock]
        @price = options[:price]
        add_to_products
        puts self
    end

    def add_stock(quantity)
      @stock += quantity
    end

    def reduce_stock(quantity)
      @stock -= quantity
    end

    def in_stock?
        self.stock > 0
    end

    def self.all
        @@products
    end

    def self.in_stock
        @@products.select {|product| product.stock > 0 }
    end


    def self.find_by_title(name)
        item  = @@products.select{|product| product.title == name}
        if(!item.nil?)
            item.pop
        end
    end


    private

    def add_to_products
        @@products.each do |product|
            if(product.title == self.title)
                raise DuplicateProductError, "Product #{product.title} already exists"
            end
        end
        @@products << self
    end

end
