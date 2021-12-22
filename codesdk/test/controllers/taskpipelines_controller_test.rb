require "test_helper"

class TaskpipelinesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get taskpipelines_index_url
    assert_response :success
  end

  test "should get create" do
    get taskpipelines_create_url
    assert_response :success
  end

  test "should get update" do
    get taskpipelines_update_url
    assert_response :success
  end

  test "should get destroy" do
    get taskpipelines_destroy_url
    assert_response :success
  end
end
