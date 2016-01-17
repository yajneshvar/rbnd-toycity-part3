
class Product
 attr_reader :title
 @@products = []

    def initialize(options={})
        @title = options[:title]
        add_to_products
    end

    def self.all
        @@products
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
