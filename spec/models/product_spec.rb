require 'rails_helper'

RSpec.describe Product, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  it "order by product name" do
  	a = Product.where("name LIKE ?", "%promise1%")

  	expect(Product.search("promise1")).to eq(a)
  end
end
