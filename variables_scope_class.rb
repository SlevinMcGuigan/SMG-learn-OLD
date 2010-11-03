class VariablesScope

  def initialize
    local_variable           = "local"
    @instance_variable       = "instance"
    @@class_variable         = "class"
    $global_variable         = "global"
    @@get_and_set_variable   = "empty"
  end
  
  def local_variable()
    return local_variable
  end

  def instance_variable()
    return @instance_variable
  end

  def class_variable()
    return @@class_variable
  end

  def global_variable()
    return $global_variable
  end
  
  def hello_world()
    puts("Hello, World. Greetings from class VariablesScope")
  end
  
  def get_and_set_variable(*args)
    if args.length == 0
      return @@get_and_set_variable
    elsif args.length == 1
      @@get_and_set_variable = args[0]
    else
      throw("THIS SHIT DOES NOT WORK!")
    end
  end
  
end