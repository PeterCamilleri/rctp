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

desc "Alternative test procedure"
task :alt_test do |t|
  here  = File.dirname(__FILE__)
  block = "{|file| require file if File.basename(file) =~ /test/}"
  code = "Dir['#{here}/test/*.rb'].each #{block}"
  cmd   = "ruby -e\"#{code}\""
  system cmd
end
