require 'test/unit'

class Open3Test < Test::Unit::TestCase

    def test_simple_matches
        assert('Susi Sorglos lebt ein schönes Leben' =~ /lebt/,                  'Ja, Susi lebt :)')
        assert('Susi Sorglos lebt ein schönes Leben' =~ /l..t.*[äöü]/,           'Ja, Susi lebt ein äöü Leben:)')
        assert_equal(0,'Susi' =~ /S/,                                            'aha, es wird ab 0 gezählt...')
        assert_equal(13, 'Susi Sorglos lebt ein schönes Leben' =~ /l..t.*[äöü]/, 'Ja, Susi lebt an Stelle 13')
    end
    
    def test_simple_negative_matches
        assert_nil('Susi Sorglos' =~ /Tom Jones/,      'Tom steckt nicht in Susi... ha ha')
        assert_nil('A' =~ /a/,                         'A ist ungleich a')
        assert(    'A' =~ /a/i,                        'nur machnmal ist A doch gleich a')
    end

end