#!/bin/bash

#===================================================#
# 				CMS in RoR WEBAPP 		  			#
#		 	  Script de instalación		  			#
#---------------------------------------------------#
#		Escrito por Juan Fuentes el 19/07/2020		#
#	    	Actualizado el 23/03/2023       		#
#===================================================#

#===================================================#
#		  	NO EDITAR FUERA DE LINUX	  			#	
#---------------------------------------------------#
# En caso de edición fuera de linux, es probable no #
# pueda ejecutarse el script por el formato, en 	#
# este caso deberemos de volver a encodear con el 	#
# paquete dos2unix y posteriormente convertirlo:	#
#													#
# sudo apt-get install dos2unix   					#
# dos2unix install.sh			  					#
# sudo chmod +x install.sh			  				#
#===================================================#


#---------------------------------------------------#
# INSTALACIÓN DE RUBY 								#
# @docs: https://www.ruby-lang.org/en/documentation/installation/
# @return: Lenguaje en que se programo el sitio
#---------------------------------------------------#
# Crear folder para instalación y acceder al mismo 	#
#!/bin/bash

# Dependencias de sistema
sudo apt update

# Dependencias de Ruby on Rails
sudo apt-get install build-essential libssl-dev libyaml-dev libreadline-dev openssl curl software-properties-common libffi-dev git-core zlib1g-dev bison libxml2-dev libxslt1-dev libcurl4-openssl-dev libsqlite3-dev sqlite3 -y

#---------------------------------------------------#
#       INSTALACIÓN DE RUBY con rbenv						  #
#---------------------------------------------------#
#
sudo apt install rbenv 
rbenv install 3.1.3
rbenv global 3.1.3

gem install bundler


#---------------------------------------------------#
# INSTALACIÓN DE APACHE								#
# @docs: https://help.ubuntu.com/lts/serverguide/httpd.html
sudo apt-get install apache2 -y
sudo apt install apache2

#---------------------------------------------------
# INSTALACIÓN DE PASSENGER							
# @docs: https://www.phusionpassenger.com/library/	
# @see: https://www.phusionpassenger.com/docs/advanced_guides/install_and_upgrade/apache/install/oss/focal.html
#---------------------------------------------------
# Instalamos el paquete
# Install our PGP key and add HTTPS support for APT
sudo apt-get install -y dirmngr gnupg
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 561F9B9CAC40B2F7
sudo apt-get install -y apt-transport-https ca-certificates

# Add our APT repository
sudo sh -c 'echo deb https://oss-binaries.phusionpassenger.com/apt/passenger focal main > /etc/apt/sources.list.d/passenger.list'
sudo apt-get update

# Install Passenger + apache module
sudo apt-get install -y libapache2-mod-passenger
# Actualizamos sistema
sudo apt-get update
# Activamos el módulo ´mod-passenger´
sudo a2enmod passenger
# Reiniciamos apache para poder ocupar passenger
sudo apache2ctl restart
#---------------------------------------------------#
# INSTALACIÓN DE IMAGEMAGICK						
# @docs: http://www.imagemagick.org/				
# @return: Procesamiento de imágenes				
#---------------------------------------------------#
sudo apt-get install imagemagick -y
sudo apt-get install libmagickwand-dev -y
sudo apt-get install libjpeg-dev libpng-dev libtiff-dev libwebp-dev -y

#---------------------------------------------------#
# INSTALACIÓN DE POSTGRESQL
#---------------------------------------------------#
sudo apt update
sudo apt install postgresql postgresql-contrib libpq-dev -y
sudo systemctl status postgresql

# login & set 'postgres' password
sudo su postgres
sudo -u postgres psql
ALTER USER postgres WITH PASSWORD 'a(jshEtd=dm$#mka-A'; #Asignación de contraseña a usuario default
CREATE USER root WITH PASSWORD 'a(jshEtd=dm$#mka-A'; # Creación de usuario root con contraseña
ALTER USER root WITH SUPERUSER;
\q #exit
sudo service postgresql restart;
# ALTER USER postgres PASSWORD 'a(jshEtd=dm$#mka-A'; #Para actualizar contraseña

# node
sudo apt update
sudo apt install nodejs -y
sudo apt install npm
sudo apt install build-essential
sudo apt update && sudo apt install yarn -y

# download your repo or upload to html/* folder
cd /var/www/html
gem install bundler
bundle install

# update
sudo apt-get update && sudo apt-get upgrade -y

rake secret
sudo EDITOR=nano rails credentials:edit

sudo a2enmod headers
sudo service apache2 restart
sudo a2enmod mod_headers
sudo a2enmod expires

ssh-keygen
cat ~/.ssh/id_rsa.pub