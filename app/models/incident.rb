class Incident < ApplicationRecord
	has_many :incident_kinds, inverse_of: :incident
	has_one :user_detail
	has_one :incident_location
	has_many :incident_files

	accepts_nested_attributes_for :incident_kinds, :user_detail, :incident_location, :incident_files

	validates_presence_of :description
end
