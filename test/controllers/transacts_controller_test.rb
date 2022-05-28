require 'test_helper'

class TransactsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @transact = transacts(:one)
  end

  test 'should get index' do
    get transacts_url
    assert_response :success
  end

  test 'should get new' do
    get new_transact_url
    assert_response :success
  end

  test 'should create transact' do
    assert_difference('Transact.count') do
      post transacts_url,
           params: { transact: { amount: @transact.amount, categories: @transact.categories, category_id: @transact.category_id,
                                 name: @transact.name } }
    end

    assert_redirected_to transact_url(Transact.last)
  end

  test 'should show transact' do
    get transact_url(@transact)
    assert_response :success
  end

  test 'should get edit' do
    get edit_transact_url(@transact)
    assert_response :success
  end

  test 'should update transact' do
    patch transact_url(@transact),
          params: { transact: { amount: @transact.amount, categories: @transact.categories, category_id: @transact.category_id,
                                name: @transact.name } }
    assert_redirected_to transact_url(@transact)
  end

  test 'should destroy transact' do
    assert_difference('Transact.count', -1) do
      delete transact_url(@transact)
    end

    assert_redirected_to transacts_url
  end
end
