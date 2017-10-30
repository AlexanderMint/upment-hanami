# frozen_string_literal: true

class RefreshToken < Hanami::Entity
  extend Forwardable
  def_delegators :user_agent_decoder, :device_name, :os_name

  def browser_name
    user_agent_decoder.name
  end

  private

  def user_agent_decoder
    DeviceDetector.new(user_agent || '')
  end
end
