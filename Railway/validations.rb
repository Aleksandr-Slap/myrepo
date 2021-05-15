module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end
  
  module ClassMethods

    attr_accessor :validations

    # rubocop:disable Metrics/CyclomaticComplexity
    def validate(var, method, params = nil)
      raise 'Method name is not symbol' unless var.is_a?(Symbol) && method.is_a?(Symbol)
      raise 'No additional arguments needed for :presence' if method == :presence && params
      raise 'Additional argument required' if %i[type format].include?(method) && var.nil?

      @validations ||= []
      validations << { var: var, method: method, params: params }
    end
    # rubocop:enable Metrics/CyclomaticComplexity
  end  

  module InstanceMethods
    def validate!
      self.class.validations.each do |elem|
        send(elem[:method], instance_variable_get("@#{elem[:var]}"), elem[:params])
      end
    end

    def valid?
      validate!
      true
    rescue RuntimeError
      false
    end

    protected

    def presence(var, params)
      var.strip! if var.is_a?(String)
      raise 'Attribute cannot be empty' if ['', nil].include?(var)
    end

    def format(var, params)
      raise 'Wrong format for Regexp' unless params.class == Regexp

      raise 'Attribute mismatch' unless var =~ params
    end  

    def type(var, params)
      raise 'Class mismatch' unless var.class == params

      raise 'Class not exist' unless params.class == Class
    end 
  end
end    



class Test

  extend Validation
  include Validation

  validate :a, :presence

  def initialize(a)
    @a = a
    validate!
  end  
end

test = Test.new("")
p test.valid?
