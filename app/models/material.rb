class Material < ActiveRecord::Base

	has_and_belongs_to_many :products

	validates_presence_of :name, :unit, :price
	validates :name, uniqueness: true
end
