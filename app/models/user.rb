class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	def active_for_authentication?
	# Uncomment the below debug statement to view the properties of the returned self model values.
	# logger.debug self.to_yaml

		super && account_active?
	end
      
    def paypal_url(return_path)
	    values = {
	        business: "omairr.azam-facilitator@gmail.com",
	        cmd: "_xclick",
	        upload: 1,
	        return: "#{Rails.application.secrets.app_host}#{return_path}",
	        invoice: id,
	        amount: 12,
	        item_name: email,
	        item_number: id,
	        quantity: '1'
	    }
	    puts "#{Rails.application.secrets.paypal_host}/cgi-bin/webscr?" + values.to_query
	    "#{Rails.application.secrets.paypal_host}/cgi-bin/webscr?" + values.to_query
  	end  
end
