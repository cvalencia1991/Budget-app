json.extract! transaction, :id, :name, :amount, :user_id, :group_id, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
