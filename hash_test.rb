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

  def test_hash_index
    haircolors = {
      'svenja' => 'blond',
      'max'    => 'dark brown',
      'alice'  => 'blond'
    }
    assert_equal('blond', haircolors['svenja'],     'svenja has blond hair')
    assert_not_equal('blond', haircolors['max'],    'max does not have blond hair')
    assert_equal('blond', haircolors['alice'],      'alice has blond hair')
    
    assert_equal('alice', haircolors.index('blond'),    'the last element which matches the value "blond" is returned')
    haircolors.delete('alice')
    assert_equal('svenja', haircolors.index('blond'),   'now svenja is the only blond lady...')
    haircolors['max'] = 'blond'
    assert_equal('blond', haircolors['max'],            'max dyed his hair...')
    assert_equal('max', haircolors.index('blond'),      'max is now the last element which matches the value "blond"')
  end
  
  def test_nice_syntax
    haircolors = {
      tom:    'blond',
      jones:  'black',
      susi:   'blond',
      alice:  'blond'
    }
    assert_equal('blond', haircolors[:tom],             'tom has blond hair')
  end

end