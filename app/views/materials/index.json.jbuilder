json.array!(@materials) do |material|
  json.extract! material, :id, :name, :unit, :price
  json.url material_url(material, format: :json)
end
