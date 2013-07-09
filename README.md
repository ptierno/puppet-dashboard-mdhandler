Mdhandler
=========

Rails plugin to parse README markdown files.

Requirements
------------

* [kramdown](https://github.com/gettalong/kramdown)
* [coderay](https://github.com/rubychan/coderay)

Installation
------------

Clone the plugin to the dashboard's plugin directory:  

`cd /opt/puppet/share/puppet-dashboard/vendor/plugins`   
`git clone https://github.com/ptierno/puppet-dashboard-mdhandler ./mdhandler`   
`cd /opt/puppet/share/puppet-dashboard; RAILS_ENV=production /opt/puppet/bin/rake puppet:plugin:install`   
`service pe-httpd restart`   

Edit app/controllers/documentation_controller.rb and change the `modules_dir` variable to point to whereever your puppet modules are located.   
Edit app/views/documentation/index.erb and add a Logo or some text to the header div. Add whatever links you would like to the navigation div.   

Icons
-----

MdHandler uses Mark James' fine [Silk icons](http://www.famfamfam.com/lab/icons/silk/).

Contributors
------------

* Peter Tierno <peter.a.tierno@gmail.com>
