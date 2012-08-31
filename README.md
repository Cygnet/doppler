Doppler
=======

Doppler Project PoC Code

====== Getting Started ======

<b>Install Ruby on Rails.</b>

sudo gem install rails  
  
<b>Pull Git files.</b>

git clone git://github.com/Cygnet/doppler.git /targetDirectory\n

<b>To install mySql on a debian based system.</b>

sudo apt-get install mysql-server mysql-client  

<b>Then set the root password.sdcscd</b>

sudo mysqladmin -u root -h localhost password 'rootPassword'  

<b>To configure rails database, go to where you cloned the directory, and then edit config/database.yml. Under Development, Test, or Production add the following.</b>

adapter: mysql2  
encoding: utf8  
reconnect: false  
database: db/development  ##Anydatabase name  
pool: 5  
username: root            ##User with enough rights to create a database  
password: password        ##Password  
timeout: 5000  

<b>Then execute the following commands to install the libraries needed for mySql.</b>

sudo apt-get install libmysql-ruby  
sudo apt-get install libmysqlclient-dev  
sudo gem install mysql  
sudo gem install activerecord-mysql2-adapter  

<b>Then edit 'Gemfile' (in the root, where you cloned the git), and add the following lines.</b>

gem 'mysql'  
gem 'mysql2'  

<b>Then run the following commands, from the same directory.</b>

rake db:create  
rake db:schema:load  
  
<b>Change the username and password for the front end by editing config/users.csv</b>
  
<b>And finally, start the server</b>

rails server

<b> To start in daemon mode </b>
rails server -d   
