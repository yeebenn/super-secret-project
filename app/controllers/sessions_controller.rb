class SessionsController < ApplicationController
   skip_before_action :authorized, only: [:new, :create, :welcome]
 
   def new
      @user = User.new
   end
 
   def create
     @user = User.find_by(username: params[:username])
 
    if @user && @user.authenticate(params[:password])
       session[:user_id] = @user.id
       redirect_to '/welcome'
    else
      flash.now[:danger] = 'Invalid email/password combination'
       redirect_to '/login'
    end
 
   end
 
   def destroy
       session[:user_id] = nil
       redirect_to '/login'
   end
 
   def page_requires_login
   end
 
   def login
      if @user && @user.authenticate(params[:password])
         session[:user_id] = @user.id
         redirect_to '/welcome'
      else
   
         redirect_to '/login'
      end

   end
 
   def welcome
   end
 end