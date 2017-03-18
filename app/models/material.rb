class Material < ActiveRecord::Base

	has_many :products, through: :prices, :dependent => :destroy
	has_many :prices

	accepts_nested_attributes_for :products

	validates_presence_of :name, :unit, :price
	validates :name, uniqueness: true
	after_update :calculate_price

	def self.search(search)
	  if search
	    where('name LIKE ?', "%#{search}%")
	  else
	    where(1)
	  end
  	end

  	def calculate_price
  		self.prices.each{|p| setprice(p)}
  	end

  	def setprice(price)
  		unless price.calculated_price.nil?
				case self.unit
					when "Pcs"
						case price.unit
							when "Pcs"
								new_price = price.quantity * self.price
							when "Dozen"
								new_price = price.quantity * self.price * 12
							when "Gross"
								new_price = price.quantity * self.price * 144
						end
					when "Dozen"
						case price.unit
							when "Pcs"
								new_price = price.quantity * (self.price/12)
							when "Dozen"
								new_price = price.quantity * self.price
							when "Gross"
								new_price = price.quantity * self.price * 12
						end
					when "Gross"
						case price.unit
							when "Pcs"
								new_price = price.quantity * (self.price/144)
							when "Dozen"
								new_price = price.quantity * (self.price/12)
							when "Gross"
								new_price = price.quantity * self.price
						end
				  when "Kilogram"
				  	case price.unit
							when "Kilogram"
								new_price = price.quantity * self.price
							when "Gram"
								new_price = price.quantity * (self.price/1000)
						end
				  when "Gram"
				  	case price.unit
							when "Kilogram"
								new_price = price.quantity * (self.price/1000)
							when "Gram"
								new_price = price.quantity * self.price
						end
					else
						"You gave me #{a} -- I have no idea what to do with that."
				end
				p = Product.find price.product_id
				unless p.total_price.nil?
					total = p.total_price - price.calculated_price + new_price
					p.total_price = total
					p.save
				end
				price.calculated_price = new_price
				price.save
  		end
  	end
end
