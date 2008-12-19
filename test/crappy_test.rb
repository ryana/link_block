require 'rubygems'
require 'active_support'
require 'action_controller'
require 'action_view'
require 'action_view/test_case'
require 'test/unit'
require File.dirname(__FILE__) + '/../lib/link_block'

class ActionView::TestCase < ActiveSupport::TestCase
  class TestController < ActionController::Base
    attr_accessor :request, :response, :params

    include LinkBlock::ViewHelpers

    def initialize
      @request = ActionController::TestRequest.new
      @response = ActionController::TestResponse.new
      
      #TestCase doesn't have context of a current url so cheat a bit
      @params = {}
      send(:initialize_current_url)
    end
  end
end

class TestingIt < ActionView::TestCase

  def setup
    LinkBlock.enable
  end

  def test_link_block_works
    assert respond_to?(:link_block)
  end

end
