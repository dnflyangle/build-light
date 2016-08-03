module Blinky
  module AutomatedArchitecture
    module SirenOfShame

      def success!
        # Ding! sound and fade lights for 10 seconds
        system( "java -jar soscmd-1.0.jar -a 2 10" )
        system( "java -jar soscmd-1.0.jar -l 3 10" )
      end

      def failure!
        # Sad trombone sound for 10 seconds and Chase lights
        system( "java -jar soscmd-1.0.jar -a 1 10" )
        system( "java -jar soscmd-1.0.jar -l 2 999" )
      end

      def building!
        # On/Off lights
        system( "java -jar soscmd-1.0.jar -l 2 999" )
      end

      def warning!
      end

      def off!
        stop
      end

      def init
      end

      def stop
         system( "java -jar soscmd-1.0.jar -sl" )
         system( "java -jar soscmd-1.0.jar -sa" )
      end
    end
  end
end
