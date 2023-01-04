class ResponcesController < ApplicationController
  before_action :set_user, only: %i[new create edit]
  before_action :set_task, only: %i[new create]
  before_action :require_authentication, only: %i[new create]
before_action :require_no_authentication, only: %i[destroy]
  def new  
  
  end

  def create
    if (@user.id!=current_user.id)
    @responce = Responce.new(title: params[:title],body: params[:body] ,user_id: @user.id, task_id: @task.id)
    if (@responce.save)
      flash[:success] = "Успешно откликнулись"
      redirect_to tasks_show_path
    else
     render 'responces/new'
    end
    else
      flash[:warning] = "Вы пытаетесь откликнуться на свой вопрос" 
      redirect_to tasks_show_path  
  end
end
def edit

end
 
def set_user
    @user=User.find params[:user_id]
 end
 def set_task
  @task=Task.find params[:task_id]
end
 
 def responce_params
  params.permit(:title, :body)
 end

end