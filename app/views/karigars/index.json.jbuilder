json.array!(@karigars) do |karigar|
  json.extract! karigar, :id, :name, :address, :phone
  json.url karigar_url(karigar, format: :json)
end
