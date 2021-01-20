class Startup

    @@all = []

    attr_accessor :name, :domain
    attr_reader :founder

    def initialize (name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
    end

    def pivot(name, domain)
        self.name = name
        self.domain = domain
    end

    def self.all
        @@all
    end

    def self.find_by_founder(founde_name)
        self.all.find{|startup| startup.founder == founde_name}
    end

    def self.domains
        self.all.select{|startup| startup.domain}
    end

    def sign_contract(capitalist, type_of_inv, amount_inv)
        FundingRound.new(self, capitalist, type_of_inv, amount_inv)
    end

    #helper_method
    def funding_rounds
        FundingRound.all.select{|contract| contract.startup == self}
    end

    def num_funding_rounds
        funding_rounds.count
    end

    def total_funds
        funding_rounds.map{|contract| contract.investment}.sum
    end

    def investors
        funding_rounds.map{|contract| contract.venture_capitalist}.uniq
    end

    def big_investors
        self.investors.select{|investor| investor.total_worth > 1000000000}
    end

    

end
