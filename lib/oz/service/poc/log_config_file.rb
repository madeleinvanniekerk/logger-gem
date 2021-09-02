module Oz
  module Service
    module Poc
      class LogFileRailtie < Rails::Railtie
        config.after_initialize do
          log_file_name = "./datadog/conf.d/#{Oz::Service::Poc.source_name}.yaml".freeze
          file_contents = """
logs:
  - type: file
    path: '/app/log/#{Oz::Service::Poc.env}.log'
    service: #{Oz::Service::Poc.service_name}
    source: #{Oz::Service::Poc.source_name}
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
end
