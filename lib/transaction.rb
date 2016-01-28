
class Transaction
    attr_reader :customer, :product, :id, :quantity, :purchase, :return

    @@transactions = []

    def initialize(customer, product, options={})

        @id = @@transactions.count + 1
        @customer = customer
        @product = product
        opt = {quantity: 1, purchase: true, return: false}.merge(options)
        opt[:purchase] = !opt[:return]
        @quantity = opt[:quantity]
        @purchase = opt[:purchase]
        @return = opt[:return]
        add_transaction

    end

    def self.all
        @@transactions
    end

    def self.find(id)
        @@transactions[id-1]
    end

    def self.find_by_customer(name)
        @@transactions.each do |transaction|
             if(transaction.customer.name == name)
                transaction
             end
        end
    end

    private

    def add_transaction
        @@transactions << self
    end


end
