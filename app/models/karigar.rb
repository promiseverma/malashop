class Karigar < ActiveRecord::Base
	has_many :balance_enquiries
	validates_presence_of :name
end
