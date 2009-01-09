# Be sure to restart your server when you modify this file

# Uncomment below to force Rails into production mode when
# you don't control web/app server and can't set it the proper way
# ENV['RAILS_ENV'] ||= 'production'

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.2.2' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
	
  config.time_zone = 'UTC'

	config.gem 'wvanbergen-scoped_search', :lib => 'scoped_search', :source => 'http://gems.github.com'

  config.action_controller.session = {
    :session_key => '_rubyjobs_session',
    :secret      => 'b800e63a9ec8ae0daa993c4616b52d8d043fb2f447199f4475eea337ce2c2a453e64c770c17df69f3d1528ff2912db879c9d8f6edc2ff0b87914fe480e1cbcc2'
  }

end
