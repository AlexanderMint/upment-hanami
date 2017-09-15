# frozen_string_literal: true

require 'hanami/helpers'

module Api
  class Application < Hanami::Application
    configure do
      root __dir__
      load_paths << %w[controllers graphql]

      sessions :cookie, secret: ENV['WEB_SESSIONS_SECRET']

      # HTTP
      host 'api.up.com'
      routes 'config/routes'

      default_request_format :html
      default_response_format :json
      body_parsers :json

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

      controller.default_headers 'Access-Control-Request-Method' => 'POST, OPTIONS'
      controller.default_headers 'Access-Control-Allow-Headers' => 'Content-Type'
    end

    # DEVELOPMENT
    configure :development do
      handle_exceptions false

      controller.default_headers 'Access-Control-Allow-Origin' => '*'
    end

    # TEST
    configure :test do
      handle_exceptions false
    end

    # PRODUCTION
    configure :production do
      scheme 'https'
      host   'api.upment.com'
      port   443

      controller.default_headers 'Access-Control-Allow-Origin' => 'https://upment.com'
    end
  end
end
