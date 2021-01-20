class FundingRound

    @@all = []
    attr_accessor :type, :investment
    attr_reader :startup, :venture_capitalist

    def initialize (startup, capitalist, type, investment)
        @startup = startup
        @venture_capitalist = capitalist
        @type = type
        @investment = investment.to_f
        @@all << self
    end

    def self.all
        @@all
    end
end
