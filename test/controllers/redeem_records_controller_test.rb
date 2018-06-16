require 'test_helper'

class RedeemRecordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @redeem_record = redeem_records(:one)
  end

  test "should get index" do
    get redeem_records_url
    assert_response :success
  end

  test "should get new" do
    get new_redeem_record_url
    assert_response :success
  end

  test "should create redeem_record" do
    assert_difference('RedeemRecord.count') do
      post redeem_records_url, params: { redeem_record: { person_id: @redeem_record.person_id, redeem_item_id: @redeem_record.redeem_item_id } }
    end

    assert_redirected_to redeem_record_url(RedeemRecord.last)
  end

  test "should show redeem_record" do
    get redeem_record_url(@redeem_record)
    assert_response :success
  end

  test "should get edit" do
    get edit_redeem_record_url(@redeem_record)
    assert_response :success
  end

  test "should update redeem_record" do
    patch redeem_record_url(@redeem_record), params: { redeem_record: { person_id: @redeem_record.person_id, redeem_item_id: @redeem_record.redeem_item_id } }
    assert_redirected_to redeem_record_url(@redeem_record)
  end

  test "should destroy redeem_record" do
    assert_difference('RedeemRecord.count', -1) do
      delete redeem_record_url(@redeem_record)
    end

    assert_redirected_to redeem_records_url
  end
end
