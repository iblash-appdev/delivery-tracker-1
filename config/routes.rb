Rails.application.routes.draw do



  # Routes for the Tracker resource:

  # CREATE
  post("/insert_tracker", { :controller => "trackers", :action => "create" })
          
  # READ
  get("/trackers", { :controller => "trackers", :action => "index" })
  
  get("/trackers/:path_id", { :controller => "trackers", :action => "show" })
  
  # UPDATE
  
  post("/modify_tracker/:path_id", { :controller => "trackers", :action => "update" })
  
  # DELETE
  get("/delete_tracker/:path_id", { :controller => "trackers", :action => "destroy" })

  #------------------------------

end
