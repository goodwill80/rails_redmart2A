json.extract! user, :id, :name, :email, :address, :password, :cc_number, :created_at, :updated_at
json.url user_url(user, format: :json)