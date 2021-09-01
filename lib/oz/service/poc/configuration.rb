require_relative '../poc'

module Oz
  module Service
    module Poc
      class Configuration
        attr_accessor :datadog_api_key

        def initialize
          @datadog_api_key = nil
        end
      end
    end
  end
end
