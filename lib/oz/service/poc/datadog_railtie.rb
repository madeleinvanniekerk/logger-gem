require 'ddtrace'

class DatadogRailtie < Rails::Railtie
  initializer "datadog_railtie.configure_datadog" do

    Datadog.configure do |c|
      c.use :rails, log_injection: true
      c.service = Oz::Service::Poc.service_name
      c.env = Oz::Service::Poc.env
      c.tags = Oz::Service::Poc.tags
      c.version = '0.2'
    end
  end
end
