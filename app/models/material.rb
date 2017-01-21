class Material < ActiveRecord::Base

	has_many :products, through: :prices
	has_many :prices

	accepts_nested_attributes_for :products

	validates_presence_of :name, :unit, :price
	validates :name, uniqueness: true

	def self.search(search)
	  if search
	    where('name LIKE ?', "%#{search}%")
	  else
	    where(1)
	  end
  	end
end
