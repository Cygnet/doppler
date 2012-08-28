Doppler
=======

Doppler Project PoC Code

====== Getting Started ======

Install Ruby on Rails.

  <b>sudo gem install rails</b>
  
  
Pull Git files.

  git clone git://github.com/Cygnet/doppler.git /targetDirectory
  

To install mySql on a debian based system.

  sudo apt-get install mysql-server mysql-client

Then set the root password.sdcscd

  sudo mysqladmin -u root -h localhost password 'rootPassword'


To configure rails database, go to where you cloned the directory, and then edit config/database.yml. Under Development, Test, or Production add the following.

  adapter: mysql2</br>
  encoding: utf8</br>
  reconnect: false</br>
  database: db/development  ##Anydatabase name</br>
  pool: 5</br>
  username: root            ##User with enough rights to create a database</br>
  password: password        ##Password</br>
  timeout: 5000</br>
  
Then execute the following commands to install the libraries needed for mySql.

  sudo apt-get install libmysql-ruby
  sudo apt-get install libmysqlclient-dev
  sudo gem install mysql
  sudo gem install activerecord-mysql2-adapter

Then edit 'Gemfile' (in the root, where you cloned the git), and add the following lines.

  gem 'mysql'
  gem 'mysql2'


Then run the following commands, from the same directory.
  rake db:create
  rake db:schema:load
  
Change the username and password for the front end by editing config/users.csv
  
And finally, start the server
  rails server