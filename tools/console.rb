require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

google = Startup.new("Google", "Larry Page", "www.google.com")
apple = Startup.new("Apple", "Steve Jobs", "www.apple.com")
miranda = Startup.new("The V", "Sydney M.", "www.talktome.com")

capitalist1 = VentureCapitalist.new("Abraham L.", "10000000000000")
capitalist2 = VentureCapitalist.new("Donald J. T.", "999999999999999")
capitalist3 = VentureCapitalist.new("Pan", "500")

google.sign_contract(capitalist1, "Angel", 50000000.00)
google.sign_contract(capitalist1, "Pre-Seed", 120000000.00)
apple.sign_contract(capitalist1, "Angel", 5468296545)
google.sign_contract(capitalist3, "Angel", 20.0)
binding.pry
0 #leave this here to ensure binding.pry isn't the last line