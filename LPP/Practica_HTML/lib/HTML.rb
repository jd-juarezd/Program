#!/usr/bin/env ruby
#Alumno: Jose Daniel Juarez Davila
#Alu: 40901 

=begin rdoc
 * Las etiquetas HTML se implementan utilizando el method_missing. 
      Un ejemplo de su uso seria el siguiente:
       
       q= HTML.new {  
         html {
          head(:dir => "chazam", :lang => "spanish") { title "My wonderful home page" }
          body do
            h1 "Welcome to my home page!", :class => "chuchu", :lang => "spanish"
            b "My hobbies:"
            ul do
              li "Juggling"
              li "Knitting"
              li { i "Sleeping" } 
              li "Metaprogramming"
            end #ul
          end # body
            }
          }
      
      Los argumentos son:
      
      1. Una cadena
      2. Opcionalmente un Hash
     
      o tambien puede ser:
      
      1. El Hash opcional
      2. Un bloque especificado en el contexto que va entre corchetes
      
 * El atributo <tt>p</tt> contiene una matriz con los parrafos de la pagina <tt>html</tt>
=end rdoc

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
		text = "<#{tag}#{textattr}>#{text}</#{tag}>"
		@p[-1].push text
		text
	end

	def build_attr(h)
	return '' if h.nil? or h.empty?
	 h.inject("") { |s,x| s += %{#{x[0]} = "#{x[1]}"}}
	end

	def to_s 
           @p.join("\n")
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

