json.array!(@balance_enquiries) do |balance_enquiry|
  json.extract! balance_enquiry, :id, :lena, :dena, :balance_date
  json.url balance_enquiry_url(balance_enquiry, format: :json)
end
