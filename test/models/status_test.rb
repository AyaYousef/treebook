require 'test_helper'

class StatusTest < ActiveSupport::TestCase
  test "a status requires content" do
    status = Status.new
    assert !status.save
    assert !status.errors[:content].empty?
  end

  test "Status content should be not less than two characters" do
    status = Status.new
    status.content = "H"
    assert !status.save
    assert !status.errors[:content].empty?
  end

  test "Status has a user id" do
    status = Status.new
    status.content = "Hello"
    assert !status.save
    assert !status.errors[:user_id].empty?
  end
end
