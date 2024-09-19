require_relative "boot"

require "rails/all"

module ActionController
  class Base
    # TODO: authlogic não é compatível com nossa versão do Rails.
    #       implementar esse método corretamente depois.
    def self.prepend_before_filter(anything)
      prepend_before_action(anything)
    end
  end
end

# TODO: tentando suportar o compass-rails
#       tem um monkey patch igual em /home/embs/.rbenv/versions/3.3.5/bin/bundle
class File
  def self.exists?(args)
    exist?(args)
  end
end

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Reredu
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.2

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w[assets tasks])

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    config.assets.precompile += %w(landing.js basic.js)
    config.assets.precompile += %w(bootstrap-redu.min.css basic.css)

    config.redu_services = {}
    config.redu_services[:apps] = {
      :url => "http://aplicativos.redu.com.br"
    }
    config.redu_services[:help_center] = {
      :url => "http://ajuda.redu.com.br/"
    }
    config.redu_services[:dev] = {
      :url => "http://developers.redu.com.br/"
    }
    config.redu_services[:blog] = {
      :url => "http://blog.redu.com.br/"
    }

    config.name = "Redu"
    config.tagline = "Rede Social Educacional"
    config.description = "Rede Social Educacional"
    config.email = "contato@redu.com.br"
  end
end
