class HomeController < ApplicationController
  def index
  	redirect_to new_incident_path
  end
end
