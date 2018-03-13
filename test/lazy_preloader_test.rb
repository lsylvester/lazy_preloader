require 'test_helper'

class LazyPreloader::Test < ActiveSupport::TestCase
  test "truth" do
    assert_kind_of Module, LazyPreloader
  end
end
