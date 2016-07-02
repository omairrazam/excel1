class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    has_many :transactions
	def active_for_authentication?
	# Uncomment the below debug statement to view the properties of the returned self model values.
	# logger.debug self.to_yaml
		super && account_active
	end
      
   
end
