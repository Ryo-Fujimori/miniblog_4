require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module Miniblog4
  class Application < Rails::Application
    config.load_defaults 8.0

    config.autoload_lib(ignore: %w[assets tasks])
    config.i18n.default_locale = :ja
    config.generators do |g|
      g.helper false
      g.test_framework :rspec,
                       routing_specs: false,
                       request_specs: false,
                       view_specs: false
    end
  end
end
