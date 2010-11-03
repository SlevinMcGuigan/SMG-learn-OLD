require 'test/unit'
require 'array_constructor_class'

class ArrayConstructorTest < Test::Unit::TestCase

=begin
  def test_constructor_with_0_arguments
    ac =ArrayConstructor.new
    assert_equal('Constructor: empty array',ac.get_local_variable,   "This works?!? I guessed this would cause 'ArgumentError: wrong number of arguments 0 for 1)'\n" + \
                                                                     "But obviously ruby treats 'no array' as an empty array\n" + \
                                                                     "Well, it does when 'splatting' is used. Example: aMethod(foo, bar, *rest)")
  end
=end

  def test_constructor_with_empty_anonymous_array
    ac =ArrayConstructor.new([])
    assert_equal('Constructor: empty array',ac.get_local_variable,   "This works! Passed an anonymous empty array into the constructor")
  end

  def test_constructor_with_empty_array
    a = []
    ac =ArrayConstructor.new(a)
    assert_equal('Constructor: empty array',ac.get_local_variable,   "This works! Passed an empty array into the constructor")
  end
  
  def test_constructor_with_1_argument
    ac =ArrayConstructor.new(['ONE STRING'])
    assert_equal("Constructor: 1 argument: 'ONE STRING'",
                 ac.get_local_variable,                              "this passes. I use an anonymous 1-element array")
  end

  def test_constructor_with_2_arguments
    ac =ArrayConstructor.new(['ONE STRING', 2])
    assert_equal("Constructor: >1 argument: 'ONE STRING|2'",
                 ac.get_local_variable,                              "the 2 args are joined with a pipe as separator")
  end

  def test_constructor_with_2_arguments
    ac =ArrayConstructor.new(['eins', 2, 3, "vier"])
    assert_equal("Constructor: >1 argument: 'eins|2|3|vier'",
                 ac.get_local_variable,                              "the args are joined with a pipe as separator")
  end
  
  ### some simple array tests I needed to make sure I get everything right...

  def test_empty_array
    a = []
    assert_equal(0, a.size,                                          "An empty array has size 0")
  end


  def test_array_with_one_element
    a = ['one element', 2, "three"]
    assert_equal('one element', a[0],                                "ATTENTION: COUNT BEGINS AT 0")
    assert_equal(2,             a[1],                                "ATTENTION: COUNT BEGINS AT 0")
    assert_equal('three',       a[2],                                "ATTENTION: COUNT BEGINS AT 0")
  end

end