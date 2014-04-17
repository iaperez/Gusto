require 'test_helper'

class StoreTest < ActiveSupport::TestCase
  test "should not save a store without name" do
    store = Store.new
    assert_not store.save
  end

  test "should save a store with at least name" do
    store = Store.new
    store.name = 'first store'
    assert store.save
  end
end
