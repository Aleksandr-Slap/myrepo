# frozen_string_literal: true

require './vagon'

class PassengerVagon < Vagon
  def initialize(number, places, type_vagon = 'passenger')
    super
  end

  def take_the_place
    @occupied_places += 1
    @places -= 1
  end
end
