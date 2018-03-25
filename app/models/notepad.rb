class Notepad < ActiveRecord::Base
	enum status: [ :liye, :diye ]
	validates_presence_of :name, :note_date, :amount, :status
	acts_as_paranoid
end
