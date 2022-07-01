class UsersController < ApplicationController
  set :default_content_type, "application/json"

  #signup => create
  get "/users" do
    users = User.all
    users.to_json
  end

  get "/signed" do
    { message: "signed" }.to_json
  end

  get "/notsigned" do
    { message: "notsigned" }.to_json
  end

  post "/signup" do
    patient = Patient.new(params)
    # binding.pry
    if patient.email.blank? || patient.name.blank? || patient.password.blank? || Patient.find_by_email(params[:email]) || Patient.find_by_name(params[:name])
      redirect "/notsigned"
    else
      patient.save
      puts patient.id
      session[:patient_id] = patient.id
      redirect "/signed"
    end
  end

  #login => read
  post "/login" do
    # response.headers['Cache-Control'] = 'public, max-age=300'
    patient = Patient.find_by(:email => params[:email])
    if patient && patient.authenticate(params[:password])
      session[:patient_id] = patient.id
      patient.to_json
    else
      flash[:error] = "Invalid Credentials. Try again or sign up"
      # binding.pry
      redirect "/notsigned"
    end
  end
end
