class TransactionsController < ApplicationController
	protect_from_forgery except: [:hook]
	
	def show
		@transaction = Transaction.find params[:id]
	end

	def paypal_hook
		debugger
		params.permit! # Permit all Paypal input params
		

		status = params[:payment_status]
		@transaction = Transaction.find params[:invoice]
		@user = @transaction.user
	    
	    
	    if status == "Completed" 
	   	  @user.update_attributes account_active: true
	      @transaction.update_attributes notification: params, status: status, transaction_id: params[:txn_id], purchased_at: Time.now
	      #@user.send_confirmation_instructions
	      sign_in( @user )
	      
	    end
	    #flash[:success] = "Thanks for registration, you can login now"
	    #redirect_to new_user_session_path 
	    render nothing: true
	end

	def paypal_return
		#debugger
		u = User.last
		u.account_active = true
		u.save!

		flash.clear
		flash[:success] =  "Thanks for subscribing, You are now logged in"
		sign_in_and_redirect(User.last)
		# #redirect_to root_path , flash: {notice: "Please verify through email"}
	end
end
