class IndexController < ApplicationController
  def main   
    if user_signed_in?
    @responces=current_user.responces
    @tasks=current_user.tasks
    @user=current_user
    end
  end
end
