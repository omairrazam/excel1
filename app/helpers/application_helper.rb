module ApplicationHelper
	
	def nav_link(link_text, link_path)
	  class_name = current_page?(link_path) ? 'active' : ''

	  link_to link_text, link_path, :class => "blog-nav-item " +  class_name
	  
	end

	def resource_name
		:user
	end

	def resource
		@resource ||= User.new
	end

	def devise_mapping
		@devise_mapping ||= Devise.mappings[:user]
	end
end
