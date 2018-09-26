# coding: utf-8
# An IRB + full_dup test bed

require 'irb'

puts "Starting an IRB console with rctp loaded."

if ARGV[0] == 'local'
  require_relative 'lib/rctp'
  puts "rctp loaded locally: #{Rctp::VERSION}"

  ARGV.shift
else
  require 'rcpt'
  puts "rctp loaded from gem: #{Rctp::VERSION}"
end

IRB.start
