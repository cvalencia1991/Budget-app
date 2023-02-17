json.extract! payment, :id, :name, :Amount, :user_id, :group_id, :created_at, :updated_at
json.url payment_url(payment, format: :json)
