Registry.add_callback :core, :global_nav_widgets, "900_documentation" do |renderer|
  renderer.render :partial => 'shared/doc_nav_widgets',
    :locals => { :link_name => 'Documentation', :my_link => '/documentation/'}
end
