class InteractiveChartsController < ApplicationController
	require 'roo'

	def show_page
		cat     = Category.first
		graph   = cat.graphs.first
	
		@data1  =  graph.graph_datums.pluck(:timestamp_ms,:y1_values)
		@data2  =  graph.graph_datums.pluck(:timestamp_ms,:y2_values)
		#debugger
		
	end

	def fetch_from_sheet

		xls     = Roo::Spreadsheet.open(Rails.root.to_s +  "/excelsheet/actual.xlsm")
		cat     = Category.first
		graph   = cat.graphs.first
		dataset = graph.dataset
		# xlsxm = Roo::Excelx.open(Rails.root.to_s +  "/excelsheet/actual.xlsm")
		# first get sheet using dataset sheet_name
		# second get x and y coloumns 
		# save these columns
		# format these columns and feed them to graph.
		sheet_name = dataset.sheet_name
		x_colname  = dataset.x_colname
		y1_colname = dataset.y1_colname
		y2_colname = dataset.y2_colname
		#find sheet
		current_sheet = xls.sheet(sheet_name)
		

		GraphDatum.transaction do
		    header = current_sheet.row(5)
			((current_sheet.first_row + 5)..current_sheet.last_row).each do |i|

			row = Hash[[header, current_sheet.row(i)].transpose]
				d 			  = GraphDatum.new
				date 		  = row[x_colname].to_s
				d.x_values    = date
				d.y1_values   = row[y1_colname]
				d.y2_values   = row[y2_colname]
				d.graph_id    = graph.id
				
				# make x_values_timestamp in millisecond to send to graph
				datee = date[0..3] + '-' + date[4..5] + '-' + date[6..7]
				datee = datee.to_datetime.strftime('%s').to_i * 1000
				d.timestamp_ms = datee
				
				d.save!
			end
		end
	end
end


