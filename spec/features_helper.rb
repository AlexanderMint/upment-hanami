# frozen_string_literal: true

require_relative './spec_helper'

require 'capybara'
require 'capybara/dsl'

Capybara.app = Hanami.app

module MiniTest
  class Spec
    include Capybara::DSL
  end
end
