class Subscription < ActiveRecord::Base
	belongs_to :plan
	belongs_to :user

	before_create do |subscription|
		return subscription.plan.seats_open?
	end
	before_create :does_the_user_already_have_this_plan?

	private
	def does_the_user_already_have_this_plan?
		user = self.user
		plan = self.plan

		!user.plans.select { |p| p.id==plan.id }==1
	end
end