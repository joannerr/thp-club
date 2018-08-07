require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest

	def setup
		@user = users(:one)
	end

#doit lui renvoyer un message d'erreur si elle ne renvoie pas un bon paramètre
	# test "login with invalid information" do
	# 	get login_path
	# 	assert_template 'sessions/new'
	# 	post login_path, params: { session: { first_name: "", last_name: "", email: "", password: "" } }
	# 	assert_not flash.empty?
	# 	get root_path
	# end

#doit login la personne si elle rentre un bon ID
	test "login with valid information" do
	    get login_path
	    post login_path, params: { session: { email:    @user.email,
	                                          password: 'password' } }
	    assert_redirected_to @user
	    # follow_redirect! ERROR
	    assert_template 'users/page-club'
	    assert_select "a[href=?]", login_path, count: 0
  	end
end
