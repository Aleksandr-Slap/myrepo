module Acсessors

  def attr_accessor_with_history(*names)
    names.each do |name| 
      var_name = "@#{name}"
      define_method(name) { instance_variable_get(var_name) }
      define_method("#{name}=".to_sym) do |value| 
        instance_variable_set(var_name, value)
        history_var = instance_variable_get("#{var_name}_history") || []
        instance_variable_set("#{var_name}_history", history_var.push(value))
      end
      define_method("#{name}_history") { instance_variable_get("#{var_name}_history") }
    end 
  end

  def strong_attr_accessor(name, clas)
    var_name = "@#{name}".to_sym
    define_method(name) { instance_variable_get(var_name) }
    define_method("#{name}=".to_sym) do |value|
      if value.class == clas 
        instance_variable_set(var_name, value)
      else
        raise "Error CLASS NAME"  
      end
    end      
  end
end

class Test
  extend Acсessors

  # attr_accessor_with_history :a

  strong_attr_accessor :a, String 

end  

p test = Test.new
p test.a
p test.a = "Love"
p test.a
p test.a = :d







    
		
