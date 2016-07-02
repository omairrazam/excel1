class Transaction < ActiveRecord::Base
	belongs_to :user
	 def paypal_url(return_path)
	 	
	    values = {
	    	#ip: request.remote_ip
	        business: "omairr.azam-facilitator@gmail.com",
	        cmd: "_xclick",
	        upload: 1,
	        return: "#{Rails.application.secrets.app_host}#{return_path}",
	        invoice: id,
	        amount: 12,
	        item_name: "testing",
	        item_number: id,
	        quantity: '1',
	        notify_url: "#{Rails.application.secrets.app_host}/hook",
	        
	    }
	    "#{Rails.application.secrets.paypal_host}/cgi-bin/webscr?" + values.to_query
  	end  
end
