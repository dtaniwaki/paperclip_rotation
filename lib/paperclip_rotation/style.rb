module PaperclipRotation
  module Style

    def self.included(base)
      base.send :include, InstanceMethods
      base.alias_method_chain :convert_options, :rotation
    end
  
    module InstanceMethods
      def convert_options_with_rotation
        options = convert_options_without_rotation
        options += " -rotate #{@attachment.rotated_degrees}" if @name != :original && @attachment.rotated?
        options
      end
    end
  end
end
