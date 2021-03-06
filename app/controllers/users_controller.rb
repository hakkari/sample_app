class UsersController < ApplicationController
  def new
  		@user = User.new
		@titre = "Inscription"
  end
   def show
    @user = User.find(params[:id])
    @titre = @user.nom
  end

  def create
    @user = User.new(user_params)
    if @user.save
    	flash[:success] = "Bienvenue dans l'Application !"
    	redirect_to @user
      # Traite un succès d'enregistrement.
    else
      @titre = "Inscription"
      render 'new'
    end
  end

    def user_params
    	#:salt, :encrypted_password
    params.require(:user).permit(:nom, :email, :password,:password_confirmation)
  end
end
