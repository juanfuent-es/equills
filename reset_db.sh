#!/bin/bash
rake db:drop RAILS_ENV=production
sudo service apache2 restart
rake db:create RAILS_ENV=production
rake db:migrate RAILS_ENV=production
rake db:seed RAILS_ENV=production

sudo service apache2 reload