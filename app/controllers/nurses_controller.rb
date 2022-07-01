class NursesController < ApplicationController
  set :default_content_type, "application/json"

  #signup => create
  get "/signup" do
    { message: "invalid nurse" }.to_json
  end

  get "/nurse_signed" do
    { message: "signed nurse" }.to_json
  end

  get "/nurse_notsigned" do
    { message: "notsigned" }.to_json
  end

  post "/nursesignup" do
    nurse = Nurse.new(params)
    # binding.pry
    if nurse.email.blank? || nurse.name.blank? || nurse.password.blank? || Nurse.find_by_email(params[:email]) || Nurse.find_by_name(params[:name])
      redirect "/nurse_signup"
    else
      nurse.save
      puts nurse.id
      session[:nurse_id] = nurse.id

      # binding.pry
      redirect "/nurse_signed"
    end
  end

  #login => read

  post "/nurse_login" do
    nurse = Nurse.find_by(:email => params[:email])
    if nurse && nurse.authenticate(params[:password])
      session[:nurse_id] = nurse.id
      @newid = nurse.id
      nurse.to_json
    else
      flash[:error] = "Invalid Credentials. Try again or sign up"
      # binding.pry
      redirect "/nurse_notsigned"
    end
  end
end
