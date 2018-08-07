require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
	def setup
		@user = users(:one)
	end


	test "should get new" do
		get login_path
		assert_response :success
	end

	test "login with valid information" do
		get login_path
		post login_path, params: { session: { email:    @user.email,
		                                  password: @user.password } }
		#assert_redirected_to @user #assert_redirected_to : Assert that the redirection options passed in match those of the redirect called in the latest action. 
		# follow_redirect!
		assert_template 'users/show'
	end

end