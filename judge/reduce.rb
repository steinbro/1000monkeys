#!/usr/bin/env ruby
require 'lib.rb'

couplet1, couplet2 = nil, nil
reduce do |score, couplets|
  if couplet1.nil?
    couplet1 = couplets.first 
  elsif couplet2.nil?
    couplet2 = couplets.first
  end
end

line2, line4 = couplet1.to_s.split(" / ", 2)
line1, line3 = couplet2.to_s.split(" / ", 2)

[line1, line2, line3, line4].collect{|l| l.to_s.capitalize! }

puts line1, line2, line3, line4
