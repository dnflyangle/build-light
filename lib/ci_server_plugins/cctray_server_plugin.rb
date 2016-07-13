require 'chicanery/cctray'
require 'chicanery'
module Blinky
  module CCTrayServer
    include Chicanery

    def watch_cctray_server url, options = {}
      server Chicanery::Cctray.new 'blinky build', url, options

      build_names = ENV['BUILDS'].split(",").map{|value| value.strip}

      when_run do |state|
        build_state = state[:servers]["blinky build"].delete_if { |key, value|
          !(build_names.include? key)
        }
        is_buidling = build_state.map { |key, value|
          value[:activity].to_s.eql? "building"
        }.reduce(:|)

        if is_buidling
          building!
        else
          is_success = build_state.map { |key, value|
            value[:last_build_status].to_s.eql? "success"
          }.reduce(:&)

          if is_success
            success!
          else
            failure!
          end
        end
      end

      begin
        run_every 15
      rescue => e
        puts e
        puts ENV["URL"]
        retry  
      end
    end
  end
end
