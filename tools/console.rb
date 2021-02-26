require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

# FundingRound.new(startup_name, vc, inv_type, initial_inv)
# Startup.new(startup_name, founder, domain)
# VentureCapitalist.new(vc_name, worth)

# domain.class => String
# investment.class => Float

startup_names = ["Clawdy Day Cat Cafe", "Go Puck Yourself", "Water Water Underwear","Copycow"]
founder_names = ["Miss Meow", "Mister Zamboni", "Some Guy", "Wishful Thinker"]
vc_names = ["Richie Rich", "Melon Musk", "Jeff Jezos", "Gill Gates"]
domain_names = ["entertainment", "sports", "retail"]

cat_cafe = Startup.new(startup_names[0],founder_names[0],domain_names[2])
hockey_store = Startup.new(startup_names[1],founder_names[1],domain_names[1])
clothing_store = Startup.new(startup_names[2],founder_names[2],domain_names[2])


richie = VentureCapitalist.new(vc_names[0],1000000.00)
melon = VentureCapitalist.new(vc_names[1],1000000001.00)
jezos = VentureCapitalist.new(vc_names[2],1000000001.00)
gill = VentureCapitalist.new(vc_names[3],1000000001.00)

fr1 = FundingRound.new(cat_cafe, melon, "type_a", 10000.0)
fr2 = FundingRound.new(cat_cafe, gill, "type_b", 20000.0)
fr3 = FundingRound.new(hockey_store, gill, "type_a", 10000.0)
fr4 = FundingRound.new(hockey_store, richie, "type_c", 10000.0)
fr5 = FundingRound.new(clothing_store, jezos, "type_a", 50000.0)

# cat_cafe.sign_contract(jezos,"kitty lovin", 34500.0)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line