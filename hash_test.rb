require 'test/unit'

class HashTest < Test::Unit::TestCase

  def test_hash_with_three_elements
    haircolors = {
      'svenja' => 'blond',
      'max'    => 'dark brown',
      'dad'    => 'white'
    }
    assert_equal('blond', haircolors['svenja'], 'svenja has blond hair')
  end

  def test_hash_simple_v1_8_and_v_1_9
    haircolors = {
      'svenja' => 'blond',
      'max'    => 'dark brown',
      'alice'  => 'blond'
    }
    assert_equal('blond', haircolors['svenja'],     'svenja has blond hair')
    assert_not_equal('blond', haircolors['max'],    'max does not have blond hair')
    assert_equal('blond', haircolors['alice'],      'alice has blond hair')
  end
  
  def test_hash_index_v1_8_and_v_1_9
    testhash = {
      '1' => 'a',
      '2' => 'b',
      '3' => 'a'
    }
    assert_equal('2', testhash.index('b'), 'this is obvious. As "b" is unique, 2 will be returned by hash.index()')
    assert_equal('1', testhash.index('a'), 'this is ambigous, "a" is not unique... Nevertheless, 1 returned')
    testhash.delete('1')
    assert_equal('3', testhash.index('a'), 'not is is ambigous again. 3 will be returned by hash.index()')
    testhash['2']='a'
    ## !!! WEIRD PART !!! ##
    if (RUBY_VERSION =~ /1\.9/) then
      assert_equal('2', testhash.index('a'), 'this is ambigous again, "a" is not unique... Nevertheless, 2 returned. Looks as if always the first element is returned')
    end
  end
  
end
