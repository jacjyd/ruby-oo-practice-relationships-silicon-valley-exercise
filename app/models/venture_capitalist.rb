class VentureCapitalist

    attr_accessor :name, :total_worth

    @@all_vcs = []

    def initialize (vc_name, worth)
        @name = vc_name
        @total_worth = worth

        @@all_vcs << self
    end

    def offer_contract (startup, inv_type, inv_amt)
        FundingRound.new(startup, self, inv_type, inv_amt)
    end

    def funding_rounds
        FundingRound.all.select{|fr| fr.venture_capitalist == self}
    end

    def portfolio
        funding_rounds.map{|fr| fr.startup}.uniq
    end

    def biggest_investment
        funding_rounds.max{|fr_a,fr_b| fr_a.investment <=> fr_b.investment}
    end

    def invested (domain_string)
        funding_rounds.select{|fr| fr.startup.domain = domain_string}.map{|fr| fr.investment}.reduce(:+)
    end

    def self.tres_commas_club
        all.select{|vc| vc.total_worth > 1000000000}
    end

    def self.all
        @@all_vcs
    end 
end
