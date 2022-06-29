class UsersController < ApplicationController
    set :default_content_type, 'application/json'

  #signup => create
  get "/users" do
    users = User.all
    users.to_json
  end

  get "/signed" do
    { message: "signed" }.to_json
    # @newid
    
  end

  get "/notsigned" do
    { message: "notsigned" }.to_json
  end

  post "/signup" do
    patient = Patient.new(params)
    # binding.pry
    if patient.email.blank? || patient.name.blank? || patient.password.blank? || Patient.find_by_email(params[:email]) || Patient.find_by_name(params[:name])
        redirect '/signup'
    else 
        patient.save
        puts patient.id
        session[:patient_id] = patient.id
        
            # binding.pry
        redirect '/signed'
        # return patient.id
        # session
    end
  end

  #login => read

  post "/login" do
    # response.headers['Cache-Control'] = 'public, max-age=300'

    patient = Patient.find_by(:email => params[:email])
    if patient && patient.authenticate(params[:password])
      @session = session
      @session[:patient_id] = patient.id
      patient.to_json
      # binding.pry
      # patient.id.to_json
      # redirect "/signed"
      # if patient 
      #   patient.id 
      # end
      # params[:email].to_json
    # return user.id
     
     
    else
    flash[:error] = "Invalid Credentials. Try again or sign up"
      # binding.pry
      redirect "/notsigned" 
    end
    
  end

  get '/loggeduser' do
    # "Data: #{@session[:patient_id]}".to_json
    # binding.pry
  end



#   if @user_id? 
#     puts @user_id
#   else

#   end

  #logout => delete


end
