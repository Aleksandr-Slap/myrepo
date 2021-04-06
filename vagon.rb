require './manufacturer.rb'

class Vagon

	include Manufacturer

	attr_reader :type_vagon, :number

	def initialize(number)
		@number = number
		@type_vagon = type_vagon
	end
end


	
