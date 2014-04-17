require 'test_helper'

class SurveyTest < ActiveSupport::TestCase
  test "should not save a survey without name" do
    survey = Survey.new
    assert_not survey.save
  end

  test "should save a survey with at least name" do
    survey = Survey.new
    survey.name = 'first survey'
    assert survey.save
  end
end
