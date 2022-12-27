class TasksController < ApplicationController
  before_action :set_user, only: %i[new create]
  before_action :set_task, only: %i[destroy]
def new

end
def search
  
  # @buf_task=Task.all.find_all do 
  #   |task| task.title==params[:value] 
  # end
  # if (@buf_task.empty?)
  #   flash[:warning] = "Not found"
  #   redirect_to tasks_show_path and return
  # else
  #   flash[:found] = "Descover parametrs"  
  # redirect_to tasks_show_path and return
  # end
  
end
def show
  
  if params[:value].present?
    @buf_task=Task.select{|task| task if((task.title.downcase.include? params[:value].downcase) || (task.category.downcase.include? params[:value].downcase))}
    else
    @buf_task=Task.all
    end

  
end
  def create
   @task = @user.tasks.build task_params
    if (@task.save)
      flash[:success] = "Successfully created"
      redirect_to new_user_task_path(current_user)
    else
      flash.now()[:warning] = "Uncorrect parametrs"
      render 'tasks/new'
    end
  end

    def edit
      @task=Task.find params[:id]

    end
    def destroy
      task=current_user.tasks.find params[:id]
      @task.destroy
      redirect_to edit_user_path(current_user)
    end
def set_task
  @task=Task.find params[:id]
end
 def set_user
    @user=User.find params[:user_id]
 end
 def task_params
  params.permit(:title, :body,:cost,:category)
 end
end