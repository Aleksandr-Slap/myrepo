# frozen_string_literal: true

require './manufacturer'

class Vagon
  include Manufacturer

  attr_reader :type_vagon, :number, :places, :occupied_places

  def initialize(number, places, type_vagon)
    @number = number
    @type_vagon = type_vagon
    @places = places
    @occupied_places = 0
    validate!
  end

  def download(number_of_cubic_meters)
    @places -= number_of_cubic_meters
    @occupied_places += number_of_cubic_meters
  end

  # rubocop:disable Style/GuardClause

  def valid?(object)
    if object.instance_of?(Vagon) || CargoVagon || CargoPassenger
      number.length > 6 and %w[passenger cargo].include?(@type_vagon)
    end
  end

  # rubocop:enable Style/GuardClause

  def validate!
    raise 'The number is too short (min. 7 simbols)' if number.length < 7
    raise 'Type must have been passenger or cargo' unless %w[passenger cargo].include?(type_vagon)
  end
end
