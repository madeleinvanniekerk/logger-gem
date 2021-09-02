# frozen_string_literal: true

require_relative "poc/version"
require_relative 'poc/configuration'
require_relative 'poc/log_file'
require_relative "poc/lograge_railtie" if defined?(Rails::Railtie)
require_relative "poc/datadog_railtie" if defined?(Rails::Railtie)

module Oz
  module Service
    module Poc
      class << self
        attr_accessor :configuration
      end

      def self.print_api_key
        puts "Datadog API key:"
        puts self.configuration.datadog_api_key
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
