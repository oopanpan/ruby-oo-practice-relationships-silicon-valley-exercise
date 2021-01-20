class VentureCapitalist

    @@all =[]

    attr_accessor :name
    attr_reader :total_worth

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth.to_f
        @@all << self
    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        @@all.select{|investor| investor.total_worth > 1000000000}
    end

    def offer_contract(startup, type, amount)
        FundingRound.new(startup, self, type, amount)
    end

    def funding_rounds
        FundingRound.all.select{|contract| contract.venture_capitalist == self}
    end

    def portfolio
        funding_rounds.map{|contract| contract.startup}.uniq
    end

    def biggest_investment
        funding_rounds.max{|contrat| contract.investment}
    end

    def invested(domain)
        arr = funding_rounds.select{|contract| contract.startup.domain == domain}
        arr.map{|contract| contract.investment}.sum
    end

end
