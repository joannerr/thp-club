require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

#test page inscription : doit retourner une erreur si la personne n'a pas entré les bons champs
  test "invalid signup entries" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: { name:  "",
                                         email: "user@invalid",
                                         password:              "foo",
                                         password_confirmation: "bar" } }
    end
    assert_template 'users/new'
    assert_not flash.empty?
  end

end
