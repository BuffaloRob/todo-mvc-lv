class SessionsController < ApplicationController

  def new  
  end

  def create
    
    if auth_hash = request.env["omniauth.auth"]
      # raise "Exiting User Loggin In Via Github".inspect
      user = User.find_or_create_by_omniauth(auth_hash)
      session[:user_id] = user.id 
      redirect_to root_path
    else
      #normal login
      user = User.find_by(:email => params[:email])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id 
        redirect_to root_path
      else 
        render 'sessions/new'
      end 
    end
  end
  # BEFORE REFACTORING, lots used in the find_or_create_by_omniauth method in User model
  # def create
  #   #HTTP is a stateless protocol
  #   ##Every request is independent
  #   if auth_hash =  request.env["omniauth.auth"] #they logged in via omniauth
  #     #persons 100% trusted email coming form github
  #     oauth_email = request.env["omniauth.auth"]["info"]["email"] 
  #     #I've seen this user beore, log them in because I know there is no way they spoofed their email
  #     if user = User.find_by(:email => oauth_email)
  #       # raise "Existing User Loggin In Via Github".inspect
  #       session[:user_id] = user.id 
  #     else
  #       # raise "New User Loggin In Via Github".inspect
  #       #I know who the person is but this is the first time on my app
  #       user = User.new(:email => oauth_email, :password => SecureRandom.hex) #I could also store the provider and their UserID on that provider
  #       if user.save
  #         session[:user_id] = user.id 
  #       else
  #         raise user.errors.full_messages.inspect
  #       end
  #     end
  #   else  #normal login
  #     user = User.find_by(:email => params[:email])
  #     if user && user.authenticate(params[:password])
  #       session[:user_id] = user.id

  #       redirect_to root_path
  #     else
  #       render 'sessions/new'
  #     end
  #   end
  # end

  def destroy
    reset_session
    redirect_to login_path
  end

end
