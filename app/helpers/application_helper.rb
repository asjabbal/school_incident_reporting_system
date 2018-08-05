module ApplicationHelper
	def get_incident_kind_name(kind)
		kind.capitalize.gsub("_", " ")
	end

	def get_user_role_name(role)
		role.capitalize.gsub("_", " ")
	end

	def get_location_name(loc)
		IncidentLocation::LOCATION_TXT[loc]
	end
end
