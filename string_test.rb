require 'test/unit'

class StringTest < Test::Unit::TestCase

    def test_length
    s = "Hello, World!"
    assert_equal(13, s.length)
    end

    def test_expression_substitution
      assert_equal("Hello!Hello!Hello!", "#{'Hello!' * 3}")
      assert_equal("99", "#{33*3}")                           # appears as if "#{...}" always returns a string
      assert_equal(99, "#{33*3}".to_i)
    end
    
    def test_tr
      s = 'Hello'
      new_s = s.tr('e','x')
      assert_equal('Hxllo', new_s)
      assert_equal('Hello', s)
    end

    def test_tr!
      s = 'Hello'
      new_s = s.tr!('e','y') #asdf
      assert_equal('Hyllo', new_s)
      assert_equal('Hyllo', s)
    end

    def test_tr
      s = 'Susi Sorglos and Max Melvin'
      new_s = s.tr('Ssu','Xxa')
      assert_equal('Xaxi Xorglox and Max Melvin', new_s)
   end

end