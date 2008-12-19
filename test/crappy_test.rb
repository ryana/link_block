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
  include LinkBlock::ViewHelpers

  def setup
    LinkBlock.enable
  end

  def test_link_block_works
    assert respond_to?(:link_block)
  end

  def test_link_block
    a = link_block(:controller => 'main') { |lb| lb.link_to 'oh', :action => 'face' }
    puts a
  end
end

__END__

At this point, this error.

The whole thing is super annoying.  Hence http://github.com/ryana/plug_test

user@ubuntu:~/link_block/test$ ruby crappy_test.rb 
Loaded suite crappy_test
Started
E.
Finished in 0.002786 seconds.

  1) Error:
test_link_block(TestingIt):
NoMethodError: undefined method `url_for' for nil:NilClass
    /usr/lib/ruby/gems/1.8/gems/actionpack-2.2.2/lib/action_view/helpers/url_helper.rb:85:in `send'
    /usr/lib/ruby/gems/1.8/gems/actionpack-2.2.2/lib/action_view/helpers/url_helper.rb:85:in `url_for'
    /usr/lib/ruby/gems/1.8/gems/actionpack-2.2.2/lib/action_view/helpers/url_helper.rb:519:in `current_page?'
    ./../lib/link_block/view_helpers.rb:23:in `link_to'
    crappy_test.rb:36:in `test_link_block'
    ./../lib/link_block/view_helpers.rb:52:in `link_block'
    crappy_test.rb:36:in `test_link_block'
    /usr/lib/ruby/gems/1.8/gems/activesupport-2.2.2/lib/active_support/testing/setup_and_teardown.rb:94:in `__send__'
    /usr/lib/ruby/gems/1.8/gems/activesupport-2.2.2/lib/active_support/testing/setup_and_teardown.rb:94:in `run'

2 tests, 1 assertions, 0 failures, 1 errors

