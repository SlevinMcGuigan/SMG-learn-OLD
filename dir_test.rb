require 'test/unit'

class DirTest < Test::Unit::TestCase
  def test_do_something_in_pwd
    assert_equal('/home/egon/mount_d/MAX DATEIEN/SMG/learn', Dir.pwd, 'using class Dir to get the pwd')
    Dir.chdir('..')
    assert_equal('/home/egon/mount_d/MAX DATEIEN/SMG', Dir.pwd, 'one directory up')
    Dir.chdir('learn')
    assert_equal('/home/egon/mount_d/MAX DATEIEN/SMG/learn', Dir.pwd, 'back again')
  end
 
  def test_xhange_pwd
    Dir.chdir('/')
  end

  def test_do_something_in_pwd_again
    assert_equal('/home/egon/mount_d/MAX DATEIEN/SMG/learn', Dir.pwd, 'using class Dir to get the pwd - again')
    Dir.chdir('..')
    assert_equal('/home/egon/mount_d/MAX DATEIEN/SMG', Dir.pwd, 'one directory up - again ')
    Dir.chdir('learn')
    assert_equal('/home/egon/mount_d/MAX DATEIEN/SMG/learn', Dir.pwd, 'back again - again')
  end

end

#class DirTest < Test::Unit::TestCase
#  def test_do_something_in_pwd
#    assert_equal('/tmp', Dir.pwd, 'using class Dir to get the PWD. REMARK: run dir_test.rb from /tmp!')
#    Dir.chdir('..')
#    assert_equal('/', Dir.pwd, 'one directory up')
#    Dir.chdir('tmp')
#    assert_equal('/tmp', Dir.pwd, 'back again')
#  end
#  
#  def test_xhange_pwd
#    Dir.chdir('/home')
#  end
#
#  def test_do_something_in_pwd_again
#    assert_equal('/tmp', Dir.pwd, 'using class Dir to get the PWD - again')
#    Dir.chdir('..')
#    assert_equal('/', Dir.pwd, 'one directory up - again')
#    Dir.chdir('tmp')
#    assert_equal('/tmp', Dir.pwd, 'back again - again')
#  end
#
#end