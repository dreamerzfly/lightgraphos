class UsersController < ApplicationController
  #before_action :signed_in_user, only: [:edit, :update]
  #before_action :correct_user, only: [:edit, :update]

  def show
  	@user = User.find(params[:id])
    @gears = @user.gears.paginate(page: params[:page]) 
    #to be able to show gear on the user pages. also need to add paginate to gemfile
    @posts_items = current_user.posts.paginate(page: params[:page])
  end

  def new
  	@user = User.new
  end

  def create
    logger.debug "user params is #{user_params}"
  	@user = User.new(user_params)
  	if @user.save
      UserMailer.welcome_email(@user).deliver
      sign_in @user
      flash[:success] = "Welcome to CLYQE!"
  		redirect_to @user
  	else
  		render 'new'
  	end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    UserMailer.cancel_email(@user).deliver
    @user.destroy
    flash[:success] = "User destroyed"
    redirect_to home_path
  end

  private

    def user_params
    	params.require(:user).permit(:name, :email, :password, :password_confirmation, :profile_picture)
    end

    # Before filters

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

end