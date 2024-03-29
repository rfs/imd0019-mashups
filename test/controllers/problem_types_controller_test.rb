require 'test_helper'

class ProblemTypesControllerTest < ActionController::TestCase
  setup do
    @problem_type = problem_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:problem_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create problem_type" do
    assert_difference('ProblemType.count') do
      post :create, problem_type: { name: @problem_type.name }
    end

    assert_redirected_to problem_type_path(assigns(:problem_type))
  end

  test "should show problem_type" do
    get :show, id: @problem_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @problem_type
    assert_response :success
  end

  test "should update problem_type" do
    patch :update, id: @problem_type, problem_type: { name: @problem_type.name }
    assert_redirected_to problem_type_path(assigns(:problem_type))
  end

  test "should destroy problem_type" do
    assert_difference('ProblemType.count', -1) do
      delete :destroy, id: @problem_type
    end

    assert_redirected_to problem_types_path
  end
end
