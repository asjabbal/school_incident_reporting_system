class IncidentLocation < ApplicationRecord
	SCHOOL = "school".freeze
	TRANSPORTATION = "transportation".freeze
	EVENT = "event".freeze
	OTHER = "other".freeze

	LOCATIONS = [SCHOOL, TRANSPORTATION, EVENT, OTHER]

	LOCATION_TXT = {
		SCHOOL => "On school campuses and grounds",
		TRANSPORTATION => "During transportation to and from school",
		EVENT => "At school-sponsored events",
		OTHER => "More details"
	}

	enum location: LOCATIONS
  belongs_to :incident
end