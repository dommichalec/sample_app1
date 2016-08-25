require 'test_helper'
# bundle exec rails test:models

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "Test Child", email: "test@testsuite.com")
  end

  test "user should be valid" do
    assert @user.valid?
  end

  test "user name should not be blank" do
    @user.name = "     "
    assert_not @user.valid?
  end

  test "user email should not be blank" do
    @user.email = "     "
    assert_not @user.valid?
  end

  test "user name should not be too long" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  test "user email should not be too long" do
    @user.email = "a" * 61
    assert_not @user.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar..com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "email should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email
    @user.save
    assert_not duplicate_user.valid?
  end

  test "email addresses should be saved as lower-case" do
   mixed_case_email = "Foo@ExAMPle.CoM"
   @user.email = mixed_case_email
   @user.save
   assert_equal mixed_case_email.downcase, @user.reload.email
  end 
end
