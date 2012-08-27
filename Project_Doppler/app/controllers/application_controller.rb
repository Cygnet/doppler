require "csv"
class ApplicationController < ActionController::Base
  protect_from_forgery

  userfile = "config/users.csv"
  userfile = CSV.read(userfile)
  userfile.find_all do |r|
    puts "%s%s" % [r[1],r[0]]
    http_basic_authenticate_with :name => r[0], :password => r[1]
    break
  end 
end
