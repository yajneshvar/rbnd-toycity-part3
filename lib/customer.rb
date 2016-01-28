
class Customer
    attr_reader :name, :postal_code

    @@customers = []


    def initialize(options={})
        @name = options[:name]
        if(!options[:date_of_birth].nil?)
          @date_of_birth = options[:date_of_birth]
        end

        if(!options[:postal_code].nil?)
          @postal_code = options[:postal_code]
        end

        add_customer
    end

    def purchase(product)
        new_product = Product.find_by_title(product.title)
        if(new_product.nil? || new_product.stock <= 0)
            raise OutOfStockError, "#{product.title} is out of stock"
        end
        new_product.reduce_stock(1)
        transaction = Transaction.new(self,product)
    end


    def return(product)
        new_product = Product.find_by_title(product.title)
        if(new_product.nil?)
            raise NonExistentProductError, "#{product.title} is invalid"
        end
        new_product.add_stock(1)
        transaction = Transaction.new(self,product,return: true)
    end

    def get_date
      @date_of_birth.strftime("Date: %d/%m/%Y")
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
