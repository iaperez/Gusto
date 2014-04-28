require 'test_helper'

class SearchesHelperTest < ActionView::TestCase
  include SearchesHelper

  test "calculating cosine similarity" do
    a1 = [1, 0]
    b1 = [0, 1]
    assert_equal(0.0, cosine_similarity(b1, a1))

    a1 = [0, 1]
    b1 = [0, 1]
    assert_equal(1.0, cosine_similarity(b1, a1))

    a1 = [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1]
    b1 = [0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1]
    assert_equal(0.33333333333333337, cosine_similarity(a1, b1))
  end
end
