class UsersController < ApplicationController 
  
  def new
    @user=User.new
  end

  def create
    @user=User.new user_params
    if (@user.save)
      flash[:success] = "Welcome to the site #{@user.name}"
     sign_in(@user)
      redirect_to root_path
    else 
      flash.now()[:warning] = "Uncorrect params"
      render :'index/main'
    end
  end

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end