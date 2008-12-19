require 'link_block/config'
require 'link_block/view_helpers'

module LinkBlock
  def self.enable
    ActionView::Base.send :include, LinkBlock::ViewHelpers
  end
end
 
#thanks will_paginate (via dpickett-tab_menu) for this snippet
if defined?(Rails) and defined?(ActionController)
  LinkBlock.enable
end
