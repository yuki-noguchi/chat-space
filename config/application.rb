require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)


module ChatSpace
  class Application < Rails::Application
    config.i18n.default_locale = :ja
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local
    config.generators do |g|
      g.javascripts false
      g.helper false
      g.test_framework false
      g.assets false
    end
  end
end
