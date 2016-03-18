#!/usr/bin/ruby
match = /[a-zA-Z]|\d/.match(ARGV.to_s)
puts match[0]

