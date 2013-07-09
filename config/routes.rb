ActionController::Routing::Routes.draw do |map|
  
  map.doc '/documentation/:md', :controller => :documentation, :action => :index, :requirements => { :md => /.*/ }

end
