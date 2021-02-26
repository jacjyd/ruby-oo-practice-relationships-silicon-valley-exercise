class FundingRound

    attr_accessor :type, :investment
    attr_reader :startup, :venture_capitalist

    @@all_funding_rounds = []

    def initialize (startup_name, vc, inv_type, initial_inv)
        @startup = startup_name
        @venture_capitalist = vc
        @type = inv_type
        @investment = initial_inv

        @@all_funding_rounds << self
    end 

    def self.all
        @@all_funding_rounds
    end 

end
