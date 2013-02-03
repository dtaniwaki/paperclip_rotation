require 'test_helper'

class PaperclipRotationTest < Test::Unit::TestCase
  def setup
    super
    build_dummy_table
  end

  def test_paperclip_rotation
    reset_class :Dummy, :styles => {:original => '', :thumb => '64x64#'}
    dummy = Dummy.create!(:image => File.open("#{ROOT}/test/fixtures/12k.png"))
    dummy.image.styles.each do |name, style|
      assert style.convert_options == ""
    end
    dummy.image.rotate!
    dummy.image.styles.each do |name, style|
      if name == :original
        assert style.convert_options == ""
      else
        assert style.convert_options == " -rotate 90"
      end
    end
  end
end
