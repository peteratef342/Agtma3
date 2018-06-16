require 'test_helper'

class RedeemItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @redeem_item = redeem_items(:one)
  end

  test "should get index" do
    get redeem_items_url
    assert_response :success
  end

  test "should get new" do
    get new_redeem_item_url
    assert_response :success
  end

  test "should create redeem_item" do
    assert_difference('RedeemItem.count') do
      post redeem_items_url, params: { redeem_item: { cost: @redeem_item.cost, name: @redeem_item.name } }
    end

    assert_redirected_to redeem_item_url(RedeemItem.last)
  end

  test "should show redeem_item" do
    get redeem_item_url(@redeem_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_redeem_item_url(@redeem_item)
    assert_response :success
  end

  test "should update redeem_item" do
    patch redeem_item_url(@redeem_item), params: { redeem_item: { cost: @redeem_item.cost, name: @redeem_item.name } }
    assert_redirected_to redeem_item_url(@redeem_item)
  end

  test "should destroy redeem_item" do
    assert_difference('RedeemItem.count', -1) do
      delete redeem_item_url(@redeem_item)
    end

    assert_redirected_to redeem_items_url
  end
end
