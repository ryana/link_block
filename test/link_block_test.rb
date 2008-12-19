require 'test/unit'
require 'rubygems'
require 'active_support'
require 'action_controller'
require 'action_controller/test_case'
require 'action_controller/test_process'
require 'action_view'
require 'action_view/test_case'
require File.dirname(__FILE__) + '/../lib/link_block'
 
RequestMock = Struct.new("Request", :request_uri, :protocol, :host_with_port, :env)
 
class ActionView::TestCase < ActiveSupport::TestCase

  include ActionView::Helpers::UrlHelper
  include LinkBlock::ViewHelpers

  def setup
    @controller = Class.new do
      attr_accessor :url, :request
      def url_for(options)
        url
      end
    end
    @controller = @controller.new
    @controller.request = ActionController::TestRequest.new

    url = {:controller => 'weblog', :action => 'show'}
    @controller.url = ActionController::UrlRewriter.new(@controller.request, url)
  end

  def test_link_block_builder
    a = link_block :controller => 'my_test' do |lb|
      lb.link_to 'hi', :action => 'index'
    end

    assert a
    puts a
  end

end

