class TasksController < ApplicationController
  before_action :set_user, only: %i[new create]
def new

end

  def create
   @task=@user.tasks.build task_params
    if (@task.save)
      flash[:success] = "Successfully created"
      redirect_to new_user_task_path(current_user)
    else
      flash.now()[:warning] = "Uncorrect parametrs"
      render 'tasks/new'
    end
  end



 def set_user
    @user=User.find params[:user_id]
 end
 def task_params
  params.permit(:title, :body, :category)
 end
end