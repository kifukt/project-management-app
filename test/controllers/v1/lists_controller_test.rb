require 'test_helper'

module V1
  class ListsControllerTest < ActionDispatch::IntegrationTest
    setup do
      user = users(:one)
      user.confirm

      @header = {
        'X-User-Email': user.email,
        'X-User-Token': user.authentication_token
      }
    end

    test 'creates list for user' do
      list_params = {
        name: Faker::Overwatch.quote,
        table_id: tables(:one).id
      }

      post(
        v1_lists_path,
        headers: @header,
        params: { list: list_params }
      )

      list = JSON.parse(@response.body)['data']['list']
      assert_response :success

      assert list['name'] == list_params[:name]
    end

    test 'update list' do
      list_params = {
        name: Faker::Overwatch.quote
      }

      patch(
        v1_list_path(lists(:one).id),
        headers: @header,
        params: { list: list_params }
      )

      list = JSON.parse(@response.body)['data']['list']
      assert_response :success

      assert list['name'] == list_params[:name]
    end

    test 'show list' do
      get(
        v1_list_path(lists(:one).id),
        headers: @header
      )

      list = JSON.parse(@response.body)['data']['list']
      assert_response :success

      assert list['name'] == lists(:one).name
      assert list['id'] == lists(:one).id
    end


    test 'get table\'s lists' do
      get(
        v1_lists_path,
        headers: @header
      )

      assert_response :ok
    end

    test 'delete list' do
      delete(
        v1_list_path(lists(:one).id),
        headers: @header,
      )
      assert_response :success
    end
  end
end
