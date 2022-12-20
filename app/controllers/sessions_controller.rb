class SessionsController < ApplicationController

  def new
    
  end

def create
 
  user = User.find_by(email: params[:email])
  if user&.authenticate(params[:password])
   sign_in(user)
    flash[:success]="Hello #{user.name}!"
   redirect_to root_path
  else
    flash.now().notice="Incorrect email and/or password"
    render 'index/main'
    
  end
end
def destroy
  log_out
  redirect_to root_path
end
end