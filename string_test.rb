require 'test/unit'

class StringTest < Test::Unit::TestCase

  def test_length
    s = "Hello, World!"
    assert_equal(13, s.length,'test string.length')
  end

  def test_expression_substitution
    assert_equal("Hello!Hello!Hello!", "#{'Hello!' * 3}",   'test expression substitution')
    assert_equal("xxxhollerahidiyyy", "xxx#{jodeln()}yyy",  'test expression substituion with a method')
    assert_equal("99", "#{33*3}")                           #==>  "#{...}" always returns a string
    assert_equal(99, "#{33*3}".to_i)
  end
  
  def test_tr
    s = 'Hello'
    new_s = s.tr('e','x')
    assert_equal('Hxllo', new_s,'tr changes the returned copy of a string')
    assert_equal('Hello', s,    'tr does not change the initial string' )
  end

  def test_tr!
    s = 'Hello'
    new_s = s.tr!('e','y')
    assert_equal('Hyllo', new_s, 'tr! changes the returned copy of a string')
    assert_equal('Hyllo', s,     'tr! does change the initial string')
  end

  def test_tr
    s = 'Susi Sorglos and Max Melvin'
    new_s = s.tr('Ssu','Xxa')
    assert_equal('Xaxi Xorglox and Max Melvin', new_s, 'S replaced by X, s by s and u by a. This is case-sensitive')
  end

  def jodeln
    return("hollerahidi")
  end
  
end