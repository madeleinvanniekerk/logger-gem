module Oz
  module Service
    module Poc
      class LogFile
        log_file_name = "./datadog/conf.d/ruby.yaml".freeze
        file_contents = """
logs:
  - type: file
    path: '/app/log/production.log'
    service: ruby
    source: ruby
    sourcecategory: sourcecode""".freeze

        unless File.exist?(File.dirname(log_file_name))
          FileUtils.mkdir_p(File.dirname(log_file_name))
        end

        File.open(log_file_name, "w") do |f|
          f.write file_contents
        end
      end
    end
  end
end
