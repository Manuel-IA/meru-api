require 'test_helper'

module Api
  module V1
    class ProductsControllerTest < ActionDispatch::IntegrationTest
      include Devise::Test::IntegrationHelpers

      setup do
        @product = products(:product_one)
        @user = users(:default_user)
        sign_in @user
      end

      test "should get index" do
        get v1_products_url, as: :json
        assert_response :success
      end

      test "should create product" do
        assert_difference('Product.count') do
          post v1_products_url, params: { product: { name: 'New Product', price: 19.99, description: 'New description', approximate_dimensions: '15cm x 25cm x 35 cm' } }, as: :json
        end

        assert_response :created
      end

      test "should not create product with missing data" do
        assert_no_difference('Product.count') do
          post v1_products_url, params: { product: { price: 19.99, description: 'Missing name and dimensions' } }, as: :json
        end

        assert_response :unprocessable_entity
        response_body = JSON.parse(response.body)
        assert_includes response_body['errors'], "Name can't be blank"
        assert_includes response_body['errors'], "Approximate dimensions can't be blank"
      end

      test "should not create product with invalid price" do
        assert_no_difference('Product.count') do
          post v1_products_url, params: { product: { name: 'Invalid Price Product', price: -5, description: 'Negative price', approximate_dimensions: '15cm x 25cm x 35cm' } }, as: :json
        end

        assert_response :unprocessable_entity
        response_body = JSON.parse(response.body)
        assert_includes response_body['errors'], "Price must be greater than or equal to 0"
      end

      test "should show product" do
        get v1_product_url(@product), as: :json
        assert_response :success
      end

      test "should update product" do
        patch v1_product_url(@product), params: { product: { name: 'Updated Name' } }, as: :json
        assert_response :success
      end

      test "should not update product with invalid data" do
        patch v1_product_url(@product), params: { product: { price: -10 } }, as: :json
        assert_response :unprocessable_entity
        response_body = JSON.parse(response.body)
        assert_includes response_body['errors'], "Price must be greater than or equal to 0"
      end

      test "should destroy product" do
        assert_difference('Product.count', -1) do
          delete v1_product_url(@product), as: :json
        end

        assert_response :no_content
      end
    end
  end
end
