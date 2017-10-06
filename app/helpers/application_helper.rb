module ApplicationHelper
	# this method will return the string active
	# if its on the current page of path
	def active?(path)
		"active" if current_page?(path)
	end
end
