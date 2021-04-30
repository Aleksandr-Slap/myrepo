# frozen_string_literal: true

require './vagon'

class CargoVagon < Vagon
  def initialize(number, places, type_vagon = 'cargo')
    super
  end

  def download(number_of_cubic_meters)
    @places -= number_of_cubic_meters
    @occupied_places += number_of_cubic_meters
  end
end
