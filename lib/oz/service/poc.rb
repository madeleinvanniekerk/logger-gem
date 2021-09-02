# frozen_string_literal: true

require_relative "poc/version"
require_relative 'poc/configuration'
require_relative "poc/log_config_file"
require_relative "poc/lograge_railtie" if defined?(Rails::Railtie)
require_relative "poc/datadog_railtie" if defined?(Rails::Railtie)

module Oz
  module Service
    module Poc
      class << self
        attr_accessor :configuration
      end

      def self.service_name
        self.configuration.service_name
      end

      def self.source_name
        self.configuration.source_name
      end

      def self.env
        self.configuration.env
      end

      def self.tags
        self.configuration.tags
      end

      def self.configuration
        @configuration ||= Configuration.new
      end

      def self.reset
        @configuration = Configuration.new
      end

      def self.configure
        yield(configuration)
      end
    end
  end
end
