json.extract! user, :id, :name, :email, :password_digest, :address, :is_admin, :province_id, :created_at, :updated_at
json.url user_url(user, format: :json)
