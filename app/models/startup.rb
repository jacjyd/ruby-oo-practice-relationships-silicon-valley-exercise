class Startup

    attr_accessor :name, :domain
    attr_reader :founder

    @@all_startups = []

    def initialize (startup_name, founder, domain)
        @name = startup_name
        @founder = founder
        @domain = domain

        @@all_startups << self
    end

    def pivot (new_domain, new_name)
        @name = new_name
        @domain = new_domain
    end 

    def sign_contract (vc, inv_type, investment_amt)
        new_funding_round = FundingRound.new(self, vc, inv_type, investment_amt)
    end 

    def funding_rounds
        FundingRound.all.select{|fr| fr.startup == self}
    end

    def num_funding_rounds
        funding_rounds.count
    end

    def total_funds
        funding_rounds.map{|fr| fr.investment}.sum
    end

    def investors
        funding_rounds.map{|fr| fr.venture_capitalist}.uniq
    end

    def big_investors
        investors.select{|investor| VentureCapitalist.tres_commas_club.include?(investor)}
    end


    def self.domains
        all.map{|startup| startup.domain}.uniq
    end

    def self.find_by_founder (founder_name)
        error_message = "There is no founder of that name in the system."
        all.find(ifnone = error_message){|startup| startup.founder == founder_name}
    end

    def self.all
        @@all_startups
    end

end
