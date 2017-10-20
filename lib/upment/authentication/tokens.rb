# frozen_string_literal: true

module Authentication
  class Tokens
    attr_reader :refresh_token
    attr_reader :access_token

    SEPARATOR = '$'

    def initialize(header_token)
      @refresh_token, @access_token = header_token.gsub(/^Bearer\s/, '').split(SEPARATOR)
    end

    def authorized?
      !user.nil?
    end

    def user
      @user ||= if access_data
                  user_repository.find_by(id: access_data['sub'])
                elsif refresh_token
                  token_repository.find_with_user(token: refresh_token)
                end
    end

    def new_header_token
      [@refresh_token, user.access_token].join(SEPARATOR)
    end

    private

    def access_data
      JWT.decode(access_token, ENV['JWT_SECRET']).first
    rescue JWT::DecodeError
      return
    end

    def user_repository
      @user_repository ||= UserRepository.new
    end

    def token_repository
      @token_repository ||= RefreshTokenRepository.new
    end
  end
end
