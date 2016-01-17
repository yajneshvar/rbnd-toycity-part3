
class Customer
    attr_reader :name

    @@customers = []


    def initialize(options={})
        @name = options[:name]
        add_customer
    end

    def self.find_by_name(user_name)
        customer = @@customers.select{ |customer| customer.name == user_name}.pop
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
