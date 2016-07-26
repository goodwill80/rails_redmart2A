require 'test_helper'

class CategoriesProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @categories_product = categories_products(:one)
  end

  test "should get index" do
    get categories_products_url
    assert_response :success
  end

  test "should get new" do
    get new_categories_product_url
    assert_response :success
  end

  test "should create categories_product" do
    assert_difference('CategoriesProduct.count') do
      post categories_products_url, params: { categories_product: { category_id: @categories_product.category_id, product_id: @categories_product.product_id } }
    end

    assert_redirected_to categories_product_url(CategoriesProduct.last)
  end

  test "should show categories_product" do
    get categories_product_url(@categories_product)
    assert_response :success
  end

  test "should get edit" do
    get edit_categories_product_url(@categories_product)
    assert_response :success
  end

  test "should update categories_product" do
    patch categories_product_url(@categories_product), params: { categories_product: { category_id: @categories_product.category_id, product_id: @categories_product.product_id } }
    assert_redirected_to categories_product_url(@categories_product)
  end

  test "should destroy categories_product" do
    assert_difference('CategoriesProduct.count', -1) do
      delete categories_product_url(@categories_product)
    end

    assert_redirected_to categories_products_url
  end
end
