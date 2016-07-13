require 'rubygems'
require 'blinky'
require 'dotenv'
Dotenv.load

light = Blinky.new.light
light.watch_cctray_server ENV['URL'], {:user => ENV['USERNAME'], :password => ENV['PASSWORD']}
# light.watch_test_server
