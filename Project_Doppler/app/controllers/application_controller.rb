require "csv"
require "yaml"

class ApplicationController < ActionController::Base
  protect_from_forgery

  def get_config(data, field)
    configfile = "config/doppler_config.yml"

    parsed = begin 
      YAML.load(File.open(configfile))
    rescue ArgumentError => e
      puts "Could not parse YAML: #{e.message}"
    end

    return parsed[data][field]
  end 
 
  def self.get_config(data, field)
    configfile = "config/doppler_config.yml"

    parsed = begin 
      YAML.load(File.open(configfile))
    rescue ArgumentError => e
      puts "Could not parse YAML: #{e.message}"
    end

    return parsed[data][field]
  end
 
  username = get_config("credentials", "username")
  password = get_config("credentials", "password")

  #http_basic_authenticate_with :name => username, :password => password
end
