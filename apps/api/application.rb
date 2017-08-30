# frozen_string_literal: true

require 'hanami/helpers'
require 'hanami/assets'

module Api
  class Application < Hanami::Application
    configure do
      # Base
      root __dir__

      load_paths << %w[controllers views]

      # HTTP
      host 'lvh.me'
      routes 'config/routes'

      default_request_format :json
      default_response_format :json

      # TEMPLATES
      templates 'templates'
      layout :application

      # SECURITY
      security.x_frame_options 'DENY'
      security.x_content_type_options 'nosniff'
      security.x_xss_protection '1; mode=block'
      security.content_security_policy %(
        form-action 'self';
        frame-ancestors 'self';
        base-uri 'self';
        default-src 'none';
        script-src 'self';
        connect-src 'self';
        img-src 'self' https: data:;
        style-src 'self' 'unsafe-inline' https:;
        font-src 'self';
        object-src 'none';
        plugin-types application/pdf;
        child-src 'self';
        frame-src 'self';
        media-src 'self'
      )

      view.prepare do
        include Hanami::Helpers
        include Api::Assets::Helpers
      end
    end

    # DEVELOPMENT
    configure :development do
      handle_exceptions false
    end

    # TEST
    configure :test do
      handle_exceptions false
    end

    # PRODUCTION
    configure :production do
      scheme 'https'
      host   'upment.ru'
      port   443
    end
  end
end
