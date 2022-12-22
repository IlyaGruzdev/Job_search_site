class SessionsController < ApplicationController
def create
  user = User.find_by(email: params[:email])
  if user&.authenticate(params[:password])
   sign_in(user)
   remember user if (params[:remember_me] == "1")
    flash[:success]="Hello #{user.name}!"
   redirect_to root_path
  else
    flash.notice="Incorrect email and/or password"
    redirect_to root_path
    
  end
end
def destroy
  log_out
  redirect_to root_path
end
end