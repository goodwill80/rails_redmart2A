class UsersController < ApplicationController
  #setting default users
  before_action :set_user,      only:   [:show, :edit, :update, :destroy]
  #check if alredy logged in
  before_action :require_login, only:   [:edit, :update, :destroy]
  #check if correct user
  before_action :correct_user,  except: [:index, :new, :show, :create ]

  before_action :require_logout,  only: [:new]

#@users = User.all
  # GET /users
  # GET /users.json
  def index
     @users = User.paginate(page: params[:page])
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new( permitted_user_params )
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
      @user = User.find(params[:id])
      if @user.update_attributes(permitted_user_params)
        flash[:success] = "Profile updated"
        redirect_to @user
      else
        render 'edit'
      end
    end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
  @user.destroy
  respond_to do |format|
    format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
    format.json { head :no_content }
  end
end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def permitted_user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end


    # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])

      unless current_user?(@user)
        flash[:warning] = "You are not the actual user"
        redirect_to root_url
      end
    end

    def require_logout
      if logged_in?
        flash.now[:warning] = "You must logged out to create a new user"
        redirect_to 'profile_path'
      end
    end
end
