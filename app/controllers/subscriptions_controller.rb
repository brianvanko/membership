# require 'balanced'

class SubscriptionsController < ApplicationController
	def show
		@subscription = Subscription.find(params[:id])
	end

	def index
		@subscriptions = current_user.subscriptions
	end
  def create
    # @subscription = Subscription.new()
    Balanced.configure('ak-test-wdJTqVNyJ9WlQpLiOzinDW5v07RK1boz')
    marketplace = Balanced::Marketplace.mine
    @plan = Plan.find(params["plan"])
	#add the cc token to the user
    current_user.update_attribute(:cardTokenURI, params["cardTokenURI"])
    #create the subscription
    @subscription = Subscription.new
    @subscription.user = current_user
    @subscription.plan = @plan
    @subscription.active = true
	#Create a the user
	unless current_user.accountURI
		buyer = marketplace.create_buyer(
		    :email_address => current_user.email,
		    :name     => current_user.name,
		    :card_uri => current_user.cardTokenURI
		)
		current_user.update_attribute(:accountURI, buyer.customer_uri)
	end
	buyer = Balanced::Customer.find(current_user.accountURI)
	buyer.debit(:amount => (@plan.price*100).to_i, appears_on_statement_as: "mbrshp #{@plan.name[0..8]}")

	# CompanyMailer.someone_joined(current_user,@plan).deliver 
	# UserMailer.welcomeToPlan(@plan).deliver 

    respond_to do |format|
      if @subscription.save
        format.html { redirect_to @subscription, notice: 'Subscription was successfully created.' }
        format.json { render action: 'show', status: :created, location: @subscription }
      else
        format.html { render action: 'new' }
        format.json { render json: @plan.errors, status: :unprocessable_entity }
      end
    end
  end
end