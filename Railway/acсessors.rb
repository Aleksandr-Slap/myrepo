module Acсessors

  def attr_accessor_with_history(*names)
    names.each do |name| 
      var_name = "@#{name}".to_sym
      define_method(name) {instance_variable_get(var_name) }
      if define_method("#{name}=".to_sym) do |value| ;instance_variable_set(var_name, value)
        @stored_value = []
        @stored_value.push(var_name, value) 
        end  
      end
      define_method("#{name}_history") {@stored_value}
    end  
  end 

  def strong_attr_accessor(name, clas)
    var_name = "@#{name}".to_sym
    define_method(name) { instance_variable_get(var_name) }
    define_method("#{name}=".to_sym) do |value|
      if value.class == clas 
        instance_variable_set(var_name, value)
      else
        puts "Error"  
      end
    end      
  end
end
    
		
