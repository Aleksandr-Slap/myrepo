# module Manufacturer
  
#   def add_manufacturer(param)
#   	@manufacturer = param
#   end
  
#   def show_manufacturer
#     puts @manufacturer
#   end  	
# end

module InstanceCounter 

  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end  

  module ClassMethods
    def instances
      @instance
    end  
  end

  module InstanceMethods
    @@instance ||= 0
  
    def register_instance
      self.class.register_instance
      @instance += 1
    end
  end  
end    
