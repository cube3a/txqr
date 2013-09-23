#!/usr/bin/ruby -w

require_relative "base43"

unless ARGV[0] =~ /^\h{2}+$/
  abort "usage: #{$0} hex-tx [qrencode-out [qrencode-arg...]]"
end

tx      = [ARGV[0]].pack "H*"
payload = "-" + Base43.encode(tx)

puts payload
exec(*%w{ qrencode -l Q -o }, *ARGV[1..-1], "--", payload) if ARGV[1]
