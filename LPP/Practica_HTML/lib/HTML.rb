#!/usr/bin/env ruby
#Alumno: Jose Daniel Juarez Davila
#Alu: 4090
class HTML

	attr_accessor :p

	def initialize(&b)
	 @p = [[]]
	 instance_eval &b
	end

	def method_missing(tag, *args)
		if block_given?
		 @p.push []
		 yield
		 text = @p.pop.join(' ')
		else
		 text  = args.shift
		end
		textattr =build_attr(args.shift)
		text = "<#{tag}#{textattr}>\n#{text}\n</#{tag}>"
		@p[-1].push text
		text
	end

	def build_attr(h)
	return '' if h.nil? or h.empty?
	 h.keys.map { |key| t = " #{key.to_s} = \"#{h[key]}\"" }
	end

	def to_s 
           @p.to_s
	end
end

 if __FILE__ == $0
        q= HTML.new {  
          html {
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
        puts q
      end

