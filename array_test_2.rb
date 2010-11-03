require 'test/unit'

class ArrayTest < Test::Unit::TestCase

  def test_array_with_percent_w
    a = %w{a b c d e f}
    assert_equal('c', a.slice(2),               'using slice to get the third element')
    assert_equal("abcdef", a.join,              'array still contains a-f')
    assert_equal('c', a.slice!(2),              'using slice! to get the third element')
    assert_equal("abdef", a.join,               'array does no longer contains c')
                                                
    a << ["x","y","z"]                          
    assert_equal("abdefxyz", a.join,            'array does no longer contains c')
    assert_equal(6, a.length,                   'array a is 6 characters long, 5 from a plus one for [xyz]')
    a.flatten!                                  #!!! AHA! witout this flatten! there is an array within an array.
                                                #    This does have impact on the length!!!
    assert_equal(8, a.length,                   'array a is now 8 characters long as it has been flattened')
    assert_equal("abdefxyz", a.join,            'array does no longer contains c')                                       
    a[1..2] = [nil, nil]                        
    assert_nil(a[1],                            'array is now nil at 1 and 2')
    assert_nil(a[2],                            'array is now nil at 1 and 2')
    assert_equal(8, a.length,                   'array is still 8 characters long')
    a.compact!                                  
    assert_equal(6, a.length,                   'array is now 6 characters long')
    assert(!a.empty?,                           'array is not empty')
    assert_equal("zyxfea", a.reverse.join,      'reversed array')
    a.slice!(0..a.length-2)                     #only z survives...
    assert_equal(1,a.length,                    'as only z survived and all other elements have been sliced out, the length is 1')
    a[0] = nil
    a.compact!
    assert(a.empty?,                            'finally... a is empty!')
  end

end