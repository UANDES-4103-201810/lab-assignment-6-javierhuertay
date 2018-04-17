class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy],
  before_action :is_user_logged_in?	
  
  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
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
  # POST /users.json
  def create
    @user = User.create!(user_params)
	if @user.save
	    	redirect_to root_path
		flash[:notice] = "User has been created"
	    else 
		redirect_to registrations_path
		flash[:notice] = "User hasn't been created"
    	    end  
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    @user = User.find(params[:id])
    @user.update!(update_params)
    redirect_to @user
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :last_name, :email, :password, :phone)
    end
    
    def update_params
    params.require(:user).permit(name: true, last_name: true, email: true, password:true , phone:true)
    end	
end
