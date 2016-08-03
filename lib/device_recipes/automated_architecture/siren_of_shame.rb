module Blinky
  module AutomatedArchitecture
    module SirenOfShame

      def success!
        # Ding! sound and fade lights for 10 seconds
        set_audio_pattern(2, 10)
        set_flash_pattern(3, 10)
      end

      def failure!
        # Sad trombone sound for 10 seconds and Chase lights
        set_audio_pattern(1, 10)
        set_flash_pattern(4, 999)
      end

      def building!
        # On/Off lights
        set_flash_pattern(2, 999)
      end

      def warning!
      end

      def off!
        stop
      end

      def init
      end

      def stop
         system( "java -jar lib/device_recipes/automated_architecture/soscmd-1.0.jar -sl" )
         system( "java -jar lib/device_recipes/automated_architecture/soscmd-1.0.jar -sa" )
      end

      def set_flash_pattern (pattern, duration)
          system( "java -jar lib/device_recipes/automated_architecture/soscmd-1.0.jar -l #{pattern} #{duration}" )
      end

      def set_audio_pattern (pattern, duration)
          system( "java -jar lib/device_recipes/automated_architecture/soscmd-1.0.jar -a #{pattern} #{duration}" )
      end
    end
  end
end
