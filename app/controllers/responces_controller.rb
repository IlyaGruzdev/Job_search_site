class ResponcesController < ApplicationController
  before_action :set_user, only: %i[new create]
  before_action :require_authentication, only: %i[new create]
before_action :require_no_authentication, only: %i[destroy]
  def new  
   
  end

  def create
    @responce = Responce.create(title: params[:title],body: params[:body] ,user_id: params[:user_id], task_id: params[:task_id])
    if (@responce.save)
      flash[:success] = "Successfully respond"
      redirect_to tasks_show_path
    else
      flash[:warning] = "Error"
      redirect_to new_user_responce_path(current_user)
    end


  end

  def destroy

  end
  def set_user
    @user=User.find params[:user_id]
 end
 
 def responce_params
  params.permit(:title, :body)
 end

end