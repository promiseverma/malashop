class Notepad < ActiveRecord::Base
	enum status: [ :liye, :diye ]
end
