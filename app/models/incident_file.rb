class IncidentFile < ApplicationRecord
  belongs_to :incident

  has_attached_file :document,
  									default_url: "/images/:style/missing.png",
  									path: ":rails_root/public/incident_files/incident_:incident_id/:id.:extension"
  validates_attachment_content_type :document, content_type: /\Aimage/

  private

  Paperclip.interpolates :incident_id  do |attachment, style|
	  attachment.instance.incident_id
	end
end
