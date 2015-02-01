class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user, notice: "User has been created! :)"
    else
      flash[:error] = "User hasn't been created! :("
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update_attributes user_params
      redirect_to @user, notice: "User has been updated! :)"
    else
      flash[:error] = "User hasn't been updated! :("
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @user && @user.destroy
      redirect_to users_path, notice: "Parasite has been destroyed! :)"
    else
      flash[:error] = "Parasite is still alive! :("
      redirect_to :back
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  def find_user
    @user = User.find_by id: params[:id]
  end
end
