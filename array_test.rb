require 'test/unit'

class ArrayTest < Test::Unit::TestCase

  def test_array_with_three
    a = ['this', "is", "a element"]
    assert_equal("this", a[0],       'access an array using []')
  end
  
  def test_array_using_inspect
    a = ['this', "is", "a element"]
    assert_equal("this", a[0],                                     'access an array using []')
    assert_equal("[\"this\", \"is\", \"a element\"]", a.inspect,   'using inspect to check the whole array. '+
                                                                   'Weird output format of .inspect()')
    assert_equal(3, a.length,                                      'the array has 3 elements now')
  end
  
  def test_array_using_join
    a = ['this', "is", "a element"]
    assert_equal('this_is_a element',a.join('_'),                 'using join with underscore to check the whole array')
    assert_equal('thisisa element',a.join,                        'using join to check the whole array')
  end  
  
  def test_array_push_and_pop
    a = [];
    a.push("first element")
    assert_equal('first element',a.join('_'),                     'only one element, pretty lame...')
    a.push("second-element")
    assert_equal('first element_second-element',a.join('_'),      'still pretty lame, now there are two elements')
    a.pop()
    assert_equal('first element',a.join('_'),                     'again only one element, pretty lame...')
    assert_equal(1, a.length,                                     'only one element remaining')
    a.pop()
    assert_equal(0, a.length,                                     'an empty array!')
    assert_equal('',a.join('_'),                                  'no more elementss')
    assert_kind_of(Array, a,                                      'it is still an array!')
  end
  
  def test_assert_kind_of
    a = ["a array value"];
    h = {"key" => "value"};
    s = "string"
    f = 1
    assert_kind_of(Array,  a,  'a is an Array')
    assert_kind_of(Hash,   h,  'h is a Hash')
    assert_kind_of(String, s,  's is a String')
    assert_kind_of(Fixnum, f,  'f is a Fixnum')
  end

  def test_when_does_a_fixnum_become_a_bignum
    f = 1234
    assert_kind_of(Fixnum, f,  '1234 is still Fixnum')
    f = 2**30-1
    assert_equal(1073741823,f, '2^30 is 1073741824; -1 ==> still Fixnum')
    assert_kind_of(Fixnum, f,  '2^30-1 is still Fixnum')
    
    f = f + 1
    assert_kind_of(Bignum, f,  '2^30 is already Bignum')

    f = f - 1
    assert_equal(1073741823,f, 'back to 2^30-1')
    assert_kind_of(Fixnum, f,  'f beeing 2^30-1 is on the fly converted to Fixnum again')
  end

end