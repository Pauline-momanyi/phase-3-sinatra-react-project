class NursesController < ApplicationController
    set :default_content_type, 'application/json'

  #signup => create
  get "/nurse_signup" do
    { message: "invalid nurse" }.to_json
  end

  get "/nurse_signed" do
    { message: "signed nurse" }.to_json
    # @newid
    
  end

  get "/nurse_notsigned" do
    { message: "notsigned nurse" }.to_json
  end

  post "/nurse_signup" do
    nurse = Nurse.new(params)
    # binding.pry
    if nurse.email.blank? || nurse.name.blank? || nurse.password.blank? || Nurse.find_by_email(params[:email]) || Nurse.find_by_name(params[:name])
        redirect '/nurse_signup'
    else
        # response.headers['sessions'] = session
        nurse.save
        puts nurse.id
        session[:nurse_id] = nurse.id
        
            # binding.pry
        redirect '/nurse_signed'
        # return nurse.id
        # session
    end
  end

  #login => read

  post "/nurse_login" do
    nurse = Nurse.find_by(:email => params[:email])
    if nurse && nurse.authenticate(params[:password])
      session[:nurse_id] = nurse.id
      @newid = nurse.id
      nurse.to_json
      # binding.pry
      # patient.id.to_json
      # redirect "/nurse_signed"
      # if patient 
      #   patient.id 
      # end
      # params[:email].to_json
    # return user.id
     
     
    else
      flash[:error] = "Invalid Credentials. Try again or sign up"
      # binding.pry
      redirect "/nurse_notsigned" 
    end
    
  end



#   if @user_id? 
#     puts @user_id
#   else

#   end

  #logout => delete


end
