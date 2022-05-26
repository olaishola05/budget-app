json.extract! transact, :id, :name, :amount, :categories, :category_id, :created_at, :updated_at
json.url transact_url(transact, format: :json)
