require './vagon.rb'

class PassengerVagon  < Vagon

	def initialize (number, type_vagon = 'passenger')
	  super
	  @type_vagon = type_vagon
	end  
end	
