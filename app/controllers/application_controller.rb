class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  set :access_control_expose_headers, true
  
  configure do 
    enable :sessions
    set :session_secret, "secret"
    register Sinatra::Flash
  end
  
  # Add your routes here
  get '/' do
    # binding.pry
    { message: "valid" }.to_json
  end

  # users
  get '/personal_details' do 
    detail = PatientDetail.where(patient_id: 2)
    detail.to_json(include: :patient)
  end

  # nurses
  get '/nurse_scope' do 
    detail = PatientDetail.where(doctor_id: 2)
    detail.to_json(include: :patient)
  end

  post '/newentry'
    detail = PatientDetail.create(

    )
    detail.to_json
  end

  delete '/details/:id' do 
    detail = PatientDetail.find(params[:id])
    detail.destroy 
    detail.to_json
  end

  post '/message' do 
    message = Message.create(
      body: params[:body],
      username: params[:username]
    )
    message.to_json
  end

  

end
