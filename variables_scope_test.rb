require 'test/unit'
require 'variables_scope_class'

class VariablesScopeTest < Test::Unit::TestCase

  def test_true
    assert_equal(2,1+1,'1+1=2')
  end

  def test_access_to_global_variable
    vc = VariablesScope.new()  
    assert_equal('global', vc.global_variable,            'access to a global variable is allowed')
  end

  def test_access_to_class_variable
    vc = VariablesScope.new()  
    assert_equal('class', vc.class_variable,              'access to a class variable is allowed')
  end

  def test_access_to_instance_variable
    vc = VariablesScope.new()  
    assert_equal('instance', vc.instance_variable,        'access to a instance variable is allowed')
  end
  
  def test_getter_method
    vc = VariablesScope.new()  
    assert_equal('empty', vc.get_and_set_variable,        'access via a splattened get() Method')
  end

  def test_setter_method
    vc = VariablesScope.new()  
    vc.get_and_set_variable('new value')
    assert_equal('new value', vc.get_and_set_variable,    'access via a splattened set() Method')
  end
=begin  
  def test_invalid_get_and_set_method
    vc = VariablesScope.new()  
    assert_throws("THIS SHIT DOES NOT WORK!")
  end
=end
end