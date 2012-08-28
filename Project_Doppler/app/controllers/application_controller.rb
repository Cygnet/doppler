require "csv"
require "yaml"

class ApplicationController < ActionController::Base
  protect_from_forgery

  userfile = "config/users.csv"
  userfile = CSV.read(userfile)
  userfile.find_all do |r|
    puts "%s%s" % [r[1],r[0]]
    http_basic_authenticate_with :name => r[0], :password => r[1]
    break
  end

  def get_config(data, field)
    configfile = "config/doppler_config"

    parsed = begin 
      YAML.load(File.open(configfile))
    rescue ArgumentError => e
      puts "Could not parse YAML: #{e.message}"
    end

    return parsed[data][field]
  end
end
