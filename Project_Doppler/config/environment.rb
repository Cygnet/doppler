# Load the rails application
require File.expand_path('../application', __FILE__)

# Register md5 as a thing
Mime::Type.register "md5", :md5

# Initialize the rails application
ProjectDoppler::Application.initialize!
