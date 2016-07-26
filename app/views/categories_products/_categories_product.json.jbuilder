json.extract! categories_product, :id, :product_id, :category_id, :created_at, :updated_at
json.url categories_product_url(categories_product, format: :json)