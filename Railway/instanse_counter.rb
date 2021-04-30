# frozen_string_literal: true

module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  # rubocop:disable Lint/DuplicateMethods
  module ClassMethods
    attr_accessor :instances

    def instances
      @instances ||= 0
    end
  end
  # rubocop:enable Lint/DuplicateMethods

  module InstanceMethods
    protected

    def register_instance
      self.class.instances ||= 0
      self.class.instances += 1
    end
  end
end
