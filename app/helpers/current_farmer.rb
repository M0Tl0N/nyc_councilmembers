def current_farmer
  Farmer.find_by(id: session[:farmer_id])
end

