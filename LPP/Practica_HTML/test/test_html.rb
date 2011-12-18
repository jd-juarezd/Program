require 'HTML'
require 'test/unit'

class Test_HTML < Test::Unit::TestCase
	def test_inicial
assert true ,HTML.new {html {
            head(:dir => "chazam", :lang => "spanish") { title "My wonderful home page" }
            body do
              h1 "Welcome to my home page!", :class => "chuchu", :lang => "spanish"
              b "My hobbies:"
              ul do
                li "Juggling"
                li "Knitting"
                li "Metaprogramming"
              end #ul
            end # body
          }
}	
assert true , HTML.to_s 
	end
end
