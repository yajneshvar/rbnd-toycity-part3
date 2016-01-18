
class Customer
    attr_reader :name

    @@customers = []


    def initialize(options={})
        @name = options[:name]
        add_customer
    end

    def purchase(product)
        new_product = Product.find_by_title(product.title)
        if(new_product.nil? || new_product.stock <= 0)
            raise OutOfStockError, "#{product.title} is out of stock"
        end
        transaction = Transaction.new(self,product)
    end

    def self.find_by_name(user_name)
        customer = @@customers.select{ |customer| customer.name == user_name}
        if(!customer.nil?)
            customer.pop
        end
    end

    def self.all
        @@customers
    end

    private
    
    def add_customer
        @@customers.each do |customer|
            if(customer.name == @name)
                raise DuplicateCustomerError, "Customer #{self.name} already exists"
            end
        end

        @@customers << self
    end


end
