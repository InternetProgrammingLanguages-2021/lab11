require "test_helper"

class CacheTest < ActiveSupport::TestCase
  test "should create entry for new computation" do
    cache_entry = Cache.new input: '1,2,3', output: 'foo'
    assert cache_entry.save
    retrieved_cache = Cache.find_by input: '1,2,3'
    assert_equal 'foo', retrieved_cache.output
  end

  test "should not create second entry for the exact same input" do
    cache_entry = Cache.new input: '3,4', output: 'foo'
    assert cache_entry.save
    new_cache_entry = Cache.new input: '3,4', output: 'bar'
    assert !new_cache_entry.save
  end
end
