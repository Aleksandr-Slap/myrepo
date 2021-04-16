require './manufacturer.rb'


class Vagon

	include Manufacturer
	

	attr_reader :type_vagon, :number

	def initialize(number, type_vagon)
		@number = number
		@type_vagon = type_vagon
		validate!
	end

	def valid?(object)
    if object.class == Vagon || CargoVagon || CargoPassenger
      self.number.length > 6 and ['passenger', 'cargo'].include?(@type_vagon)   
    end  
  end

	def validate!
		raise "The number is too short (min. 6 simbols)" if number.length < 7
		raise "Type must have been passenger or cargo" unless ['passenger', 'cargo'].include?(type_vagon) 
  end
end


	
