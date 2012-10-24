ActionController::Routing::Routes.draw do |map|

  #map.root :controller => "bioer" , :action => 'bioerfirstpage'
  map.main '', :controller => "bioer", :action=>'bioerfirstpage' 
  
  map.signin 'login', :controller => '/back_manager/login', :action => 'login'
  map.signout 'logout', :controller => '/back_manager/login', :action => 'logout'
 
  map.signin 'E', :controller => 'bioer', :action => 'bioer_en'
  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
  
end
