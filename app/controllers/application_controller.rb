class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_no_cache
  
  def after_sign_in_path_for(resource)
    root_path
  end
  #This method is used to control the cache a browser holds
  # Its important to manage a session so that when a user logs out the cookies are not stored
  #beyond the session
  def set_no_cache
    response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
  end
  
end
