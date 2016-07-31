class InteractiveChartsController < ApplicationController
	require 'roo'

	def show_page
		if params[:category]
			@selected_category = Category.find(params[:category])
		else
			@selected_category = Category.first
		end
debugger
		if @selected_category.present?
			@graphs 		   = @selected_category.graphs 
			@sp_graph_data     =  @selected_category.sp_graphs.pluck(:timestamp_ms, :open, :high, :low, :close)
		else
			flash.now[:notice] = "No Categories found"
		end
		
		#@graphs.second.update_data
	end

	

end


