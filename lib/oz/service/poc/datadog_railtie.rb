require 'ddtrace'

class DatadogRailtie < Rails::Railtie
  initializer "datadog_railtie.configure_datadog" do

    Datadog.configure do |c|
      c.use :rails, log_injection: true
      c.service = 'zadev'
      c.env = 'review_apps'
      c.tags = { 'team' => 'platform_squad' }
      c.version = '0.2'
    end
  end
end