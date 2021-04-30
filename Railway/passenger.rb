# frozen_string_literal: true

require './train'

class PassengerTrain < Train
  def initialize(number, type = 'passenger')
    super
    @type = type
  end
end
