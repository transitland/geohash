require 'rake/testtask'

Rake::TestTask.new do |t|
  t.test_files = FileList['test/test_*.rb']
end

if ENV['JRUBY'] || RUBY_PLATFORM =~ /java/
  task :default => [:test]
else
  require 'rake/extensiontask'
  
  Rake::ExtensionTask.new do |ext|
    ext.name = 'geohash_native'
    ext.ext_dir = 'ext'
  end

  task :default => [:compile, :test]
end
