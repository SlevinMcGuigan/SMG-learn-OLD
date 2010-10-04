require 'test/unit'
require 'overloaded_constructor_class'

class OverloadedConstructorTest < Test::Unit::TestCase

=begin
  def test_constructor_with_0_arguments
    oc = OverloadedConstructor.new
    assert_equal('Constructor: empty array',oc.get_local_variable,   "This works?!? I guessed this would cause 'ArgumentError: wrong number of arguments 0 for 1)'\n" + \
                                                                     "But obviously ruby treats 'no array' as an empty array\n" + \
                                                                     "Well, it does when 'splatting' is used. Example: aMethod(foo, bar, *rest)")
  end
=end

  def test_constructor_with_empty_anonymous_array
    oc = OverloadedConstructor.new([])
    assert_equal('Constructor: empty array',oc.get_local_variable,   "This works! Passed an anonymous empty array into the constructor")
  end

  def test_constructor_with_empty_array
    a = []
    oc = OverloadedConstructor.new(a)
    assert_equal('Constructor: empty array',oc.get_local_variable,   "This works! Passed an empty array into the constructor")
  end
  
  def test_constructor_with_1_argument
    oc = OverloadedConstructor.new(['ONE STRING'])
    assert_equal("Constructor: 1 argument: 'ONE STRING'",
                 oc.get_local_variable,                              "this passes. I use an anonymous 1-element array")
  end

  def test_constructor_with_2_arguments
    oc = OverloadedConstructor.new(['ONE STRING', 2])
    assert_equal("Constructor: >1 argument: 'ONE STRING|2'",
                 oc.get_local_variable,                              "the 2 args are joined with a pipe as separator")
  end

  def test_constructor_with_2_arguments
    oc = OverloadedConstructor.new(['eins', 2, 3, "vier"])
    assert_equal("Constructor: >1 argument: 'eins|2|3|vier'",
                 oc.get_local_variable,                              "the args are joined with a pipe as separator")
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