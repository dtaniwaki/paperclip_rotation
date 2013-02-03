module PaperclipRotation
  module Attachment

    def self.included(base)
      base.send :include, InstanceMethods
    end
  
    module InstanceMethods
      def rotate!(options = {})
        degrees = options[:degrees] || 90
        instance_write(:rotated_degrees, normalize_degrees(rotated_degrees + degrees))
        reprocess! *(styles.keys - [:original])
      end

      def rotated?
        rotated_degrees != 0
      end

      def rotated_degrees
        instance_read(:rotated_degrees) || 0
      end

      private

      def normalize_degrees(degrees)
        degrees -= 360 if degrees >= 360
        degrees += 360 if degrees <= -360
        degrees
      end
    end
  end
end
