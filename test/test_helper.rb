require 'rubygems'
require 'test/unit'
require 'mocha'
require 'active_record'
require 'logger'
require 'sqlite3'
require 'paperclip/railtie'
Paperclip::Railtie.insert

ROOT       = File.join(File.dirname(__FILE__), '..')
RAILS_ROOT = ROOT
$LOAD_PATH << File.join(ROOT, 'lib')

require 'paperclip_rotation/railtie'
PaperclipRotation::Railtie.insert

class Test::Unit::TestCase
  def setup
    silence_warnings do
      Object.const_set(:Rails, stub('Rails', :root => ROOT, :env => 'test'))
    end
  end
end

FIXTURES_DIR = File.join(File.dirname(__FILE__), "fixtures")
config = YAML::load(IO.read(File.dirname(__FILE__) + '/database.yml'))
ActiveRecord::Base.logger = Logger.new(File.dirname(__FILE__) + "/debug.log")
ActiveRecord::Base.establish_connection(config['test'])
Paperclip.logger = ActiveRecord::Base.logger

def build_dummy_table
  ActiveRecord::Base.connection.create_table :dummies, :force => true do |t|
    t.string   :name
    t.string   :image_file_name
    t.string   :image_content_type
    t.integer  :image_file_size
    t.datetime :image_updated_at
    t.integer :image_rotated_degrees
  end
end

def reset_class(class_name, options)
  Object.send(:remove_const, class_name) rescue nil
  klass = Object.const_set(class_name, Class.new(ActiveRecord::Base))
  klass.class_eval do
    include Paperclip::Glue
    has_attached_file :image, :styles => options[:styles]
  end
  klass.reset_column_information
  klass
end
