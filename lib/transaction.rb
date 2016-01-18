
class Transaction
    attr_reader :customer, :product, :id

    @@transactions = []

    def initialize(customer, product)

        @id = @@transactions.count + 1
        @customer = customer
        @product = product
        add_transaction

    end

    def self.all
        @@transactions
    end

    def self.find(id)
        @@transactions[id-1]
    end


    private

    def add_transaction
        @@transactions << self
    end


end
