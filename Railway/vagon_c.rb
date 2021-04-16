require './vagon.rb'

class CargoVagon < Vagon

	def initialize (number, type_vagon = 'cargo')
	  super
	  @type_vagon = type_vagon
  end
end