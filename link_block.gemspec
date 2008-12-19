# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{link_block}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ryan Angilly"]
  s.date = %q{2008-12-19}
  s.description = %q{Generate a block of link_to's that share parameters.}
  s.email = %q{ryan@angilly.com}
  s.extra_rdoc_files = ["README.rdoc", "lib/link_block.rb", "lib/link_block/config.rb", "lib/link_block/view_helpers.rb"]
  s.files = ["Manifest", "README.rdoc", "init.rb", "lib/link_block.rb", "lib/link_block/config.rb", "lib/link_block/view_helpers.rb", "test/link_block_test.rb", "Rakefile", "link_block.gemspec"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/ryana/link_block}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Link_block", "--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{link_block}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Generate a block of link_to's that share parameters.}
  s.test_files = ["test/link_block_test.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
