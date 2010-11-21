testhash = {
      '1' => 'a',
      '2' => 'b',
      '3' => 'c'
    }
puts "#{testhash.index('a')}"         # => 1
testhash['3'] = 'a'   
puts "#{testhash.index('a')}"         # => 1
testhash.delete('1')  
puts "#{testhash.index('a')}"         # => 3
testhash['4'] = 'a'
puts "#{testhash.index('a')}"         # => 3
testhash['3'] = 'x'
puts "#{testhash.index('a')}"         # => 4
testhash['3'] = 'a'
puts "#{testhash.index('a')}"         # => 3
testhash['1'] = 'a'
puts "#{testhash.index('a')}"         # => 3 with ruby 1.9.1p243 (2009-07-16 revision 24175) [i486-linux]
                                      # => 1 with ruby 1.8.7 (2008-08-11 patchlevel 72) [i386-cygwin]