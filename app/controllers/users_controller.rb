class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end
  
  def update
     @user = User.find(params[:id])
     if @user.update(user_params)
      flash[:notice] =  "User info was successfully updated."
      redirect_to user_path(@user.id)
     else
      render edit_user_path(@user.id)
     end
     
     
     
     
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def index
     @users = User.all
     @user = current_user
     @book = Book.new
     
  end
  
  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  
end
