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
