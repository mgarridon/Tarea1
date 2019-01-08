module ApplicationHelper

	def current_orden
		if !session[:id_orden].nil?
			Orden.find(session[:id_orden])
		else
			Orden.new
		end
	end
end
