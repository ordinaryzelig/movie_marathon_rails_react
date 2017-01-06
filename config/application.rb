require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module MovieMarathonRailsReact
  class Application < Rails::Application
    # The last time zone on earth.
    config.time_zone = "International Date Line West"
  end
end
