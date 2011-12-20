=begin rdoc

	* En este documento estan descritas algunas pruebas para verificar el buen funcionamiento del programa.

	Las Pruebas son:

	1. <tt>test_sin_valores</tt> , que ejecuta el programa con un hash vacio.

	2. <tt>test_array_p</tt> , que ejecuta el programa con una prueba corta y verifica el tamaño y contenido de los diferentes arrays.

	3. <tt>test_dimension_parrafo</tt> , que comprueba el tamaño del parrafo con uno ya definido.
  
	4. <tt>test_valor_corto</tt> , ejecuta una prueba corta del programa y compara su salida con una ya definida.

	5. <tt>test_sin_argumentos</tt> , se comprueba que si se ejecuta el programa sin argumentos, nos aparece un error.
  
=end rdoc

require 'HTML'
require 'test/unit'

class Test_HTML < Test::Unit::TestCase
	
	def test_sin_valores
        	q = HTML.new {}
        	assert_equal "", q.to_s
        end	

	def test_array_p
                q = HTML.new {html 'prueba'}	
		assert_equal 1, q.p.size
		assert_equal ["<html>prueba</html>"], q.p[0]
		assert_equal 1, q.p[0].size
                assert_equal "<html>prueba</html>", q.p[0][0]
        end
	
	def test_dimension_parrafo
		q = HTML.new {html 'prueba'}
		assert_equal 19, q.p[0][0].size
	end

	def test_valor_corto
		q = HTML.new {html 'prueba'}
		assert_equal "<html>prueba</html>", q.to_s 
	end
    
        def test_sin_argumentos
		assert_raises ArgumentError do
			q = HTML.new
		end
	end
end
