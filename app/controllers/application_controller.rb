class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  set :access_control_expose_headers, true
  
  configure do 
    enable :sessions
    set :session_secret, "secret"
    register Sinatra::Flash
  end
  
  get '/allnurses' do
    nurses = Nurse.all
    nurses.to_json
  end

  get '/allusers' do
    nurses = Patient.all
    nurses.to_json
  end
  # Add your routes here
  get '/' do
    # binding.pry
    { message: "valid" }.to_json
  end

  # users
  get '/personal_details/:id' do 
    detail = PatientDetail.where(patient_id: params[:id])
    detail.to_json(include: :patient)
  end

  # nurses
  get '/nurse_scope/:id' do 
    detail = PatientDetail.where(doctor_id: params[:id])
    detail.to_json(include: :patient)
  end

  post '/newentry' do
    detail = PatientDetail.new(params)
    detail.save
    detail.to_json
  end

  delete '/details/:id' do 
    detail = PatientDetail.find(params[:id])
    detail.destroy 
    detail.to_json
  end

  #logout
  get '/logout' do 
    session.clear 
    redirect "/nurse_signed"
  end

 
end