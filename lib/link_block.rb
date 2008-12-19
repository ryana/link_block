# The dirname is important, otherwise if rubygems is loaded before this,
# (as is the case if you are using PlugTest), then the require will get
# the installed gem instead of what you are developing.

require File.dirname(__FILE__) + '/link_block/config'
require File.dirname(__FILE__) + '/link_block/view_helpers'

module LinkBlock
  def self.enable
    ActionView::Base.send :include, LinkBlock::ViewHelpers
  end
end
 
#thanks will_paginate (via dpickett-tab_menu) for this snippet
if defined?(Rails) and defined?(ActionController)
  LinkBlock.enable
end
