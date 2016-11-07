class Material < ActiveRecord::Base
	validates_presence_of :name, :unit, :price
	validates :name, uniqueness: true
end
