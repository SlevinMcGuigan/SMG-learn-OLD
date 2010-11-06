require 'test/unit'
require "open3"
include Open3

class Open3Test < Test::Unit::TestCase

  def test_stdout_class
    stdin, stdout, stderr = popen3('pwd')
    #assert_instance_of(String, stdout,           'expecting stdout to be a string')    #==> WRONG!
    assert_instance_of(IO, stdout,                'expecting stdout to be a IO object') #==> RIGHT!
  end

  def test_stdout_readlines
    stdin, stdout, stderr = popen3('pwd')
    a = stdout.readlines()
    assert_instance_of(Array, a,                       'expecting stdout.readlines to return an Array')
    assert_equal("/home/egon/mount_d/MAX DATEIEN/SMG/learn\n", a[0], 'using readlines to squeeze stdout into a string')
  end

  def test_simple_ls
    stdin, stdout, stderr = popen3('/bin/ls')
    msg = stdout.readlines()
    assert_instance_of(Array, msg, 'expecting stdin.readlines to return an Array')
    assert(msg.to_s =~ /open3_test.rb/, 'this ruby script should be in the ls output')
  end
 
  def test_this_suxx
    stdout = %x[ ls . ]
    assert_instance_of(String, stdout, 'expecting a String object to be retuned by %x[]')
    assert_equal('/home/egon/mount_d/MAX DATEIEN/SMG/learn', Dir.pwd, 'this is where everything begins...')
    Dir.chdir('.')
    assert_equal('/home/egon/mount_d/MAX DATEIEN/SMG/learn', Dir.pwd, 'still there...')
    Dir.chdir('..')
    assert_equal('/home/egon/mount_d/MAX DATEIEN/SMG', Dir.pwd, 'now everything fails!')
  end 
 
  def test_simple_cd
    stdout = %x[ ls . ]
    assert_instance_of(String, stdout, 'expecting a String object to be retuned by %x[]')
    assert_equal('/home/egon/mount_d/MAX DATEIEN/SMG/learn', Dir.pwd, 'using class Dir to get the pwd')
    assert_equal('/home/egon/mount_d/MAX DATEIEN/SMG/learn', Dir.pwd, 'still there...')
  end 
 
#  def test_stderr_cd_into_the_nirvana
#    stdin, stdout, stderr = popen3('cd this_folder_does_not_exist')
#    e = stderr.readlines()
#    assert_instance_of(Array, e,                       'expecting stderr.readlines to return an Array')
#    #=begin
#    #assert_equal(
#    #    "/usr/bin/pdksh: cd: /cygdrive/d/BACKUP~1/SMG/this_folder_does_not_exist - No such file or directory\n",
#    #    e.to_s,
#    #    'cd into a folder that does not exist')
#    #
#    #    ==> I learned that very much stuff is written into STDERR when calling 'cd this_folder_does_not_exist' from within ruby
#    #        Example Output:
#    #        <"/usr/bin/pdksh: cd: /cygdrive/d/BACKUP~1/SMG/this_folder_does_not_exist - No such file or directory\n"> expected but was
#    #        <"/usr/lib/ruby/1.8/open3.rb:67:in `exec': No such file or directory - cd this_folder_does_not_exist (Errno::ENOENT)\n\tfrom /usr/lib/ruby/1.8/open3.rb:67:in `popen3'\n\tfrom /usr/lib/ruby/1.8/open3.rb:53:in `fork'\n\tfrom /usr/lib/ruby/1.8/open3.rb:53:in `pop
#    #        en3'\n\tfrom /usr/lib/ruby/1.8/open3.rb:51:in `fork'\n\tfrom /usr/lib/ruby/1.8/open3.rb:51:in `popen3'\n\tfrom ./learn/open3_test.rb:22:in `test_stderr_cd_into_the_nirvana'\n\tfrom /usr/lib/ruby/1.8/test/unit/testcase.rb:78:in `__send__'\n\tfrom /usr/lib/ruby/
#    #        1.8/test/unit/testcase.rb:78:in `run'\n\tfrom /usr/lib/ruby/1.8/test/unit/testsuite.rb:34:in `run'\n\tfrom /usr/lib/ruby/1.8/test/unit/testsuite.rb:33:in `each'\n\tfrom /usr/lib/ruby/1.8/test/unit/testsuite.rb:33:in `run'\n\tfrom /usr/lib/ruby/1.8/test/unit/te
#    #        stsuite.rb:34:in `run'\n\tfrom /usr/lib/ruby/1.8/test/unit/testsuite.rb:33:in `each'\n\tfrom /usr/lib/ruby/1.8/test/unit/testsuite.rb:33:in `run'\n\tfrom /usr/lib/ruby/1.8/test/unit/ui/testrunnermediator.rb:46:in `run_suite'\n\tfrom /usr/lib/ruby/1.8/test/unit
#    #        /ui/console/testrunner.rb:67:in `start_mediator'\n\tfrom /usr/lib/ruby/1.8/test/unit/ui/console/testrunner.rb:41:in `start'\n\tfrom /usr/lib/ruby/1.8/test/unit/ui/testrunnerutilities.rb:29:in `run'\n\tfrom /usr/lib/ruby/1.8/test/unit/autorunner.rb:216:in `run'
#    #        \n\tfrom /usr/lib/ruby/1.8/test/unit/autorunner.rb:12:in `run'\n\tfrom /usr/lib/ruby/1.8/test/unit.rb:278\n\tfrom ./learn/open3_test.rb:21\n">.
#    #=end
#    assert(e.to_s =~ /No such file or directory/,     'match of the most important part of the error message')
#  end

=begin   
  def test_stdin_cd_back_and_forth
    assert_equal('ToDo', 'not yet done', 'STDIN test: "cd ..", then "cd -"')
  end
  
  def test_ToDos
    assert_equal('ToDo','not yet done','more tests on STDIN, STDOUT and STDERR')
  end
=end
end
