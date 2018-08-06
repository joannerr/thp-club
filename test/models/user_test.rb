require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  	setup do
  		@user = users(:one)
  	end 

	test "should not save user without name" do
		user = User.new
		assert_not user.save
	end 

	test "should not save user with space name" do
		@user.first_name = "     "
		assert_not @user.valid?
	end

	test "email should not already exist" do
		duplicate_user = @user.dup 
		@user.save
		assert_not duplicate_user.valid?
	end
end
