# Lifted directly from http://railscasts.com/episodes/135-making-a-gem
#
# Thanks Ryan B.

require 'rubygems'
require 'rake'
require 'echoe'

Echoe.new('link_block', '0.1.0') do |p|
  p.description    = "Generate a block of link_to's that share parameters."
  p.url            = "http://github.com/ryana/link_block"
  p.author         = "Ryan Angilly"
  p.email          = "ryan@angilly.com"
  p.ignore_pattern = ["tmp/*", "script/*"]
  p.development_dependencies = []
end

Dir["#{File.dirname(__FILE__)}/tasks/*.rake"].sort.each { |ext| load ext }
