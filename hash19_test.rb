require 'test/unit'

class HashTest19 < Test::Unit::TestCase

  def test_nice_syntax_v1_9
      haircolors = {
        tom:    'blond',
        jones:  'black',
        susi:   'blond',
        alice:  'blond'
      }
      assert_equal('blond', haircolors[:tom],             'tom has blond hair')
  end
end