require_relative "./config/environment"

# Allow CORS (Cross-Origin Resource Sharing) requests
use Rack::Cors do
  allow do
    origins '*'
    resource '*', headers: :any, methods: [:get, :post, :delete, :put, :patch, :options, :head]
    
    # resource '/login',
    # :headers => :any,
    # :methods => [:post, :get]
  end
end

# Parse JSON from the request body into the params hash
use Rack::JSONBodyParser

enable :sessions

use UsersController
use NursesController

# Our application
run ApplicationController
