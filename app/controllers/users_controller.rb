class UsersController < ApplicationController 
before_action :require_authentication, only: %i[edit update]
before_action :require_no_authentication, only: %i[destroy]
before_action :set_user, only: %i[edit update destroy]


  def create
    @user=User.new user_params
    if (@user.save)
      flash[:success] = "Welcome to the site #{@user.name}"
     sign_in(@user)
      redirect_to root_path
    else 
      flash.now().notice = "Error params"
      render 'index/main'
    end
  end

 

  def edit

    @task=@user.tasks
  end 

  def update
    if (@user.update user_params)
      flash[:success] = "Successfuly updated!"
      redirect_to edit_user_url     
    else
      @task=current_user.tasks
      flash.now[:warning] = "Error parametrs!"
      render :edit   
    end
  end
  def destroy

  end
  def set_user
    @user=User.find params[:id]
  end
  def user_params
    params.permit(:name, :email, :password, :password_confirmation, :old_password)
  end
end