require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end
  test "Should not save user without name" do 
    user = User.new
    assert_not user.save
  end

  test "nameclean return a name strip" do
    user = User.new(name: /[w]/)
    assert !user.save
  end

end
