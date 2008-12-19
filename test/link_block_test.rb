require 'rubygems'
require File.dirname(__FILE__) + '/test_helper'
require File.dirname(__FILE__) + '/../lib/link_block'

class LinkBlockTest < Test::Unit::TestCase

  def setup
    pt_setup
  end

  def test_link_block_exists
    # Make sure we're sane
    assert @helper.respond_to?(:link_to)

    # Make sure we're included
    assert @helper.respond_to?(:link_block)
  end

  def test_link_block_yields_simple_link_tos
    res = pt_helper do |a|
      a.link_block(:controller => 'regular') { |lb| lb.link_to 'Sweet', :action => 'test' }
    end

    assert_select 'a', 'Sweet'
    assert_select HTML::Selector.new("a[href=/regular/test]")
  end

  def test_link_block_attaches_class_when_link_is_current
    res = pt_helper do |a|
      a.link_block(:controller => 'plug_test') { |lb| lb.link_to 'Sweet', :action => 'test_action' }
    end

    assert_select 'a', 'Sweet'
    assert_select HTML::Selector.new("a[class~=#{LinkBlock::Config.current_class_name}]")
    assert_select HTML::Selector.new("a[href=/plug_test/test_action]")
  end

end
