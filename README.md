Doppler
=======

Doppler Project PoC Code

====== Getting Started ======

<b>Install Ruby on Rails.</b>

sudo gem install rails\n
  
<b>Pull Git files.</b>

git clone git://github.com/Cygnet/doppler.git /targetDirectory\n

<b>To install mySql on a debian based system.</b>

sudo apt-get install mysql-server mysql-client\n

<b>Then set the root password.sdcscd</b>

sudo mysqladmin -u root -h localhost password 'rootPassword'\n

<b>To configure rails database, go to where you cloned the directory, and then edit config/database.yml. Under Development, Test, or Production add the following.</b>

adapter: mysql2\n
encoding: utf8\n
reconnect: false\n
database: db/development  ##Anydatabase name\n
pool: 5\n
username: root            ##User with enough rights to create a database\n
password: password        ##Password\n
timeout: 5000\n

<b>Then execute the following commands to install the libraries needed for mySql.</b>

sudo apt-get install libmysql-ruby\n
sudo apt-get install libmysqlclient-dev\n
sudo gem install mysql\n
sudo gem install activerecord-mysql2-adapter\n

<b>Then edit 'Gemfile' (in the root, where you cloned the git), and add the following lines.</b>

gem 'mysql'\n
gem 'mysql2'\n

<b>Then run the following commands, from the same directory.</b>

rake db:create\n
rake db:schema:load\n
  
<b>Change the username and password for the front end by editing config/users.csv</b>
  
<b>And finally, start the server</b>

rails server\n