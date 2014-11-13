jruby = !!()

Gem::Specification.new do |s|
  s.name     = "c_geohash"
  s.version  = '1.1.2'
  s.date     = "2014-11-12"
  s.summary  = "Geohash library that wraps native C in Ruby"
  s.email    = ["dave@popvox.com", "drew@mapzen.com"]
  s.homepage = "https://github.com/mapzen/geohash"
  s.description = "C_Geohash provides support for manipulating Geohash strings in Ruby. See http://en.wikipedia.org/wiki/Geohash. This is an actively maintained fork of the original http://rubygems.org/gems/geohash"
  s.has_rdoc = true
  s.licenses = ['MIT']
  s.authors  = ["David Troy", "Drew Dara-Abrams"]
  if ENV['JRUBY'] || RUBY_PLATFORM =~ /java/
    s.files = Dir.glob('lib/**/*')
    s.platform = 'java'
  else
    s.files = Dir.glob('ext/*') + ['lib/geohash.rb']
    s.platform = Gem::Platform::RUBY
    s.extensions << 'ext/extconf.rb'
  end
  s.test_files = ["test/test_geohash.rb"]
  s.rdoc_options = ["--main", "README.md"]
  s.extra_rdoc_files = ["README.md", "LICENSE.md"]
  s.add_development_dependency("minitest", "~> 5.4")
  s.add_development_dependency("rake", "~> 10.3")
  s.add_development_dependency("rake-compiler", "~> 0.9")
end
