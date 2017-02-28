require 'test_helper'
include Flip

class UserTest < ActiveSupport::TestCase
  describe 'middle_name_present with optional feature toggle is turned off' do
    before do
      # Flip.stubs(:middle_name_optional?).returns(false)
      @user = User.new(first_name: 'test', last_name: 'test', role: 'test')
    end

    it 'adds an error message when middle name is not present' do
      refute @user.valid?
      assert_equal 1, @user.errors[:middle_name].count
    end

    it 'does not add an error message when middle name is present' do
      @user.middle_name = 'test'

      assert @user.valid?
      assert_equal 0, @user.errors[:middle_name].count
    end
  end
end
