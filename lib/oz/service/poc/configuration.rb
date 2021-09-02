require_relative '../poc'

module Oz
  module Service
    module Poc
      class Configuration
        attr_accessor :service_name, :source_name, :env, :tags

        def initialize
          @service_name = nil
          @source_name = nil
          @env = "production"
          @tags = {}
        end
      end
    end
  end
end
