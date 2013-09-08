class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
  end

  def new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      flash[:notice] = "Updated user."
      redirect_to users_url
    else
      render 'edit'
    end
end

private
def user_params
  params.require(:user).permit(:first_name, :last_name, :phone, :email)
end
end
