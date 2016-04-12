require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "a user should enter his first name" do
    user = User.new
    assert !user.save
    assert !user.errors[:first_name].empty?
  end

  test "a user should enter his last name" do
    user = User.new
    assert !user.save
    assert !user.errors[:last_name].empty?
  end

  test "a user should enter his profile name" do
    user = User.new
    assert !user.save
    assert !user.errors[:profile_name].empty?
  end

  test " a user should have a unique profile name" do
    user = User.new
    user.profile_name = "youta"
    assert !user.save
    # puts user.errors.inspect
    assert !user.errors[:profile_name].empty?
  end

  test "a user should have a profile name without spaces" do
    user = User.new
    user.profile_name = "name with space"
    assert !user.save
    assert !user.errors[:profile_name].empty?
    assert user.errors[:profile_name].include?("Must be formatted correctly.")
  end

  test "a user should have a profile name correctly formatted" do
    user = User.new(first_name: "aya", last_name: "yousef", email: "youtasweety@gmail.com", user_id: 2)
    user.password = user.password_confirmation = "password"
    user.profile_name = "name_1"
    puts user.errors.inspect
    assert user.valid?
  end

end
