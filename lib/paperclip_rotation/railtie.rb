require 'paperclip'
require 'paperclip_rotation'

module PaperclipRotation
  if defined? Rails::Railtie
    require 'rails'
    class Railtie < Rails::Railtie
      initializer 'paperclip_rotation.insert_into_active_record' do
        ActiveSupport.on_load :active_record do
          PaperclipRotation::Railtie.insert
        end
      end
    end
  end

  class Railtie
    def self.insert
      Paperclip::Attachment.send(:include, PaperclipRotation::Attachment)
      Paperclip::Style.send(:include, PaperclipRotation::Style)
    end
  end
end
