require "bundler/gem_tasks"
require "rake/testtask"

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList["test/**/*_test.rb"]
end

task :default => :test

desc "Run a scan for smelly code!"
task :reek do |t|
  `reek --no-color lib > reek.txt`
end

desc "Fire up an IRB session with rcpt preloaded."
task :console do
  system "ruby irbt.rb local"
end

desc "What version of rctp is this?"
task :vers do |t|
  puts
  puts "rctp version = #{Rctp::VERSION}"
end

desc "Alternative test procedure, target defaults 'test'"
task :alt_test, :target do |t, args|
  args.with_defaults(:target => 'test')
  here  = File.dirname(__FILE__)
  target = "#{here}/#{args[:target]}/*.rb"
  puts "Target files = #{target}"
  puts

  block = "{|file| require file if File.basename(file) =~ /test/}"
  code  = "Dir['#{target}'].each #{block}"

  system "ruby -e\"#{code}\""
end
