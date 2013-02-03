$LOAD_PATH.push File.expand_path("../lib", __FILE__)
require 'paperclip_rotation/version'

include_files = ["README*", "LICENSE", "Rakefile", "init.rb", "{lib,tasks,test,rails,generators,shoulda_macros}/**/*"].map do |glob|
  Dir[glob]
end.flatten
exclude_files = ["**/*.rbc", "test/s3.yml", "test/debug.log", "test/paperclip.db", "test/doc", "test/doc/*", "test/pkg", "test/pkg/*", "test/tmp", "test/tmp/*"].map do |glob|
  Dir[glob]
end.flatten

spec = Gem::Specification.new do |s|
  s.name        = %q{paperclip_rotation}
  s.version     = PaperclipRotation::VERSION

  s.authors     = ["Daisuke Taniwaki"]
  s.summary     = %q{Rotation Processor For PaperclipProcess.}
  s.description = %q{Rotation Processor For PaperclipProcess.}
  s.email       = %q{james@jamesrgifford.com}
  s.homepage    = %q{http://github.com/dtaniwaki/paperclip_rotation}

  s.files             = include_files - exclude_files

  s.test_files        = Dir["test/**/*,rb"] + Dir['test/features/*']

  s.add_dependency 'paperclip', [">=3.3.0 "]
end

