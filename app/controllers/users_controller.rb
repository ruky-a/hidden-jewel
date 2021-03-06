class UsersController < ApplicationController
    before_action :authenticate_user!



  def dashboard
   end


def update
  
   @user = current_user
    if @user.update_attributes(current_user_params)
      flash[:notice] = "Saved..."
    else
      flash[:alert] = "Cannot update..."
    end
    redirect_to dashboard_path

  end


  def show
 @user = User.find(params[:id])
  end



   private


  def current_user_params
    params.require(:user).permit(:location, :status, :picture)
  end
end
