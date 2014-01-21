class Plan < ActiveRecord::Base
	belongs_to :company
	has_many :subscriptions
	has_many :users, :through => :subscriptions

	
	def seats_available
		self.max_seats - self.subscriptions.length
	end

	def seats_open?
		self.max_seats > self.subscriptions.length
	end
end
