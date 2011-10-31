class User < ActiveRecord::Base
  has_one :home_address, :class_name =>'Address', :foreign_key =>'home_id'
  has_one :business_address, :class_name =>'Address', :foreign_key =>'business_id'
  has_one :communication_address, :class_name =>'Address', :foreign_key =>'communication_id'
  has_one :demographic
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
end
