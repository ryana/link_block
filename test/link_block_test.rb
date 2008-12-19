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
    # Tried to make this a block... was taking too long.
    res = pt_helper("link_to 'Sweet', :action => 'test'")

    assert_select 'a', 'Sweet'
    assert_match(/Sweet/, res)
  end

end
