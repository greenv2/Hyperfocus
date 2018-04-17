require 'test_helper'

class StudyGuidesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @study_guide = study_guides(:one)
  end

  test "should get index" do
    get study_guides_url
    assert_response :success
  end

  test "should get new" do
    get new_study_guide_url
    assert_response :success
  end

  test "should create study_guide" do
    assert_difference('StudyGuide.count') do
      post study_guides_url, params: { study_guide: { title: @study_guide.title } }
    end

    assert_redirected_to study_guide_url(StudyGuide.last)
  end

  test "should show study_guide" do
    get study_guide_url(@study_guide)
    assert_response :success
  end

  test "should get edit" do
    get edit_study_guide_url(@study_guide)
    assert_response :success
  end

  test "should update study_guide" do
    patch study_guide_url(@study_guide), params: { study_guide: { title: @study_guide.title } }
    assert_redirected_to study_guide_url(@study_guide)
  end

  test "should destroy study_guide" do
    assert_difference('StudyGuide.count', -1) do
      delete study_guide_url(@study_guide)
    end

    assert_redirected_to study_guides_url
  end
end
