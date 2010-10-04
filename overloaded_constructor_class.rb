class OverloadedConstructor
  
  def initialize(array_of_arguments)
    if(array_of_arguments.size == 0)
      @local_variable = "Constructor: empty array"
    elsif (array_of_arguments.size == 1)
      @local_variable = "Constructor: 1 argument: '#{array_of_arguments[0]}'"
    elsif (array_of_arguments.size > 1)
      @local_variable = "Constructor: >1 argument: '#{array_of_arguments.join('|')}'"
    else
      # modify this to raise exception, later  
      puts "I don't have a fucking clue how you managed to come here!!!!! BIIIIIIG question mark to be answered!"
    end      
  end
  
  def get_local_variable
    return @local_variable
  end
  
end