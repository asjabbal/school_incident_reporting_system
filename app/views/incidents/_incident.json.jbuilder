json.extract! incident, :id, :suspect_info, :witness_info, :occurred_at, :description, :created_at, :updated_at
json.url incident_url(incident, format: :json)
