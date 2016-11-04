json.array!(@accounts) do |account|
  json.extract! account, :id, :transaction_date, :particular, :debit, :credit, :customer_id
  json.url account_url(account, format: :json)
end
