class TransactionsController < ApplicationController
	def create

	end

	def edit
		
	end

	def show
		@transaction = Transaction.find params[:id]
	end

	def paypal_hook
		
		params.permit! # Permit all Paypal input params
		#debugger
		status = params[:payment_status]
		@transaction = Transaction.find params[:invoice]
		@user = @transaction.user
	    #@custom = Base64.decode64(params[:custom])
	    #@user = User.ne
	    #@user.email = @custom[0]
	    #@user.password = @custom[2]
	    
	    if status == "Completed" 
	   	  @user.update_attributes account_active: true
	      @transaction.update_attributes notification: params, status: status, transaction_id: params[:txn_id], purchased_at: Time.now
	      #@user.send_confirmation_instructions
	    end
	    #redirect_to root_path 
	    render nothing: true
	end

	def paypal_return
		redirect_to root_path , flash: {notice: "Please verify through email"}
	end
end
