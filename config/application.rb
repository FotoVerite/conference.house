require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module House
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    ActiveModelSerializers.config.adapter = :json_api # Default: `:attributes`

    config.autoload_paths += %W(#{config.root}/lib)
    config.browserify_rails.commandline_options = '-t [ babelify ] --extension=".jsx"'

  end
end
