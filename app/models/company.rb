class Company < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :plans
  has_and_belongs_to_many :categories
  has_attached_file :avatar, :styles => { :thumb => "100x100>" }
  validates_attachment :avatar,
  :content_type => { :content_type => ["image/jpg", "image/jpeg", "image/gif", "image/png"] }
 
  geocoded_by :full_address
  before_save :geocode

  private

  def full_address
  	[address, city, state,
  	zipcode].compact.join ', '
  end
  
end
