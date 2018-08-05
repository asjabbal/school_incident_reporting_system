class IncidentKind < ApplicationRecord
	ALCOHOL = "alcohol".freeze
	BULLYING = "bullying".freeze
	HAZING = "hazing".freeze
	DRUGS = "drugs".freeze
	GRAFFITI = "graffiti".freeze
	INJURY = "injury".freeze
	SUSPICIOUS_ACTIVITY = "suspicious_activity".freeze
	TRESPASSING = "trespassing".freeze
	VANDALISM = "vandalism".freeze
	WEAPONS_VIOLATION = "weapons_violation".freeze
	TECHNOLOGY_MISUSE = "technology_misuse".freeze
	OTHER = "other".freeze

	KINDS = [ALCOHOL, BULLYING, HAZING, DRUGS, GRAFFITI, INJURY, SUSPICIOUS_ACTIVITY, TRESPASSING, VANDALISM, WEAPONS_VIOLATION, TECHNOLOGY_MISUSE, OTHER].freeze

	enum kind: KINDS
  belongs_to :incident
end 