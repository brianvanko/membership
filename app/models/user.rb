class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :subscriptions
  has_many :plans, :through => :subscriptions 

  after_create :send_welcome_mail
  def send_welcome_mail
  	puts "created welcome email"
    UserMailer.welcome_email(self).deliver
  end

  def admin?
  	self.name=~/brian/i
  end

end
