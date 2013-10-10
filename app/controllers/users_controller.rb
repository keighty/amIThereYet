class UsersController < ApplicationController
  before_action :set_user,       only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user, only: [:edit, :index, :update]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: [:index]

  # GET /users
  def index
    @users = User.paginate(page: params[:page], limit: 10)
  end

  # GET /users/1
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Welcome!"
      redirect_to @user
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      flash[:success] = "Your profile has been updated"
      redirect_to @user
    else
      render action: 'edit'
    end
  end

  # DELETE /users/1
  def destroy
    set_user.destroy
    flash[:success] = "User destroyed."
    redirect_to users_url
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end

    def correct_user
      redirect_to(root_url) unless current_user?(set_user)
    end

    def admin_user
      unless is_admin?
        store_location
        redirect_to signin_url, notice: "Please sign in as admin."
      end
    end
end
