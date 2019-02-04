# frozen_string_literal: true

require 'test_helper'

class BienvenueControllerTest < ActionDispatch::IntegrationTest
  test 'should get home' do
    get bienvenue_home_url
    assert_response :success
  end
end
