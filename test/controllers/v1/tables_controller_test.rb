require 'test_helper'

module V1
  class TablesControllerTest < ActionDispatch::IntegrationTest
    setup do
      user = users(:one)
      user.confirm

      @header = {
        'X-User-Email': user.email,
        'X-User-Token': user.authentication_token
      }
    end

    test 'creates table for user' do
      table_params = {
        name: Faker::Overwatch.quote,
        is_private: true
      }

      post(
        v1_tables_path,
        headers: @header,
        params: { table: table_params }
      )

      table = JSON.parse(@response.body)['data']['table']
      assert_response :success

      assert table['name'] == table_params[:name]
      assert table['is_private'] == table_params[:is_private]
    end

    test 'update table for user' do
      table_params = {
        name: Faker::Overwatch.quote
      }

      patch(
        v1_table_path(tables(:one).id),
        headers: @header,
        params: { table: table_params }
      )

      table = JSON.parse(@response.body)['data']['table']
      assert_response :success

      assert table['name'] == table_params[:name]
    end

    test 'show table' do
      get(
        v1_table_path(tables(:one).id),
        headers: @header
      )

      table = JSON.parse(@response.body)['data']['table']
      assert_response :success

      assert table['name'] == tables(:one).name
      assert table['id'] == tables(:one).id
      assert table['is_private'] == tables(:one).is_private
    end


    test 'get user\'s private tables' do
      get(
        v1_tables_path,
        headers: @header
      )

      assert_response :ok
    end

    test 'delete table' do
      delete(
        v1_table_path(tables(:one).id),
        headers: @header,
      )
      assert_response :success
    end
  end
end
