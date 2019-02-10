class UsersController < ApplicationController
	def index
		@users = User.all
	end 


	def show
		@users = User.find(params[:id])
	end

	def new
    @user = User.new
  end

  def create
  	@user = User.new(first_name: params[:first_name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation], city: City.all.sample, description: params[:description])

    if @user.save
      flash[:notice] ="L'utilisateur a bien été créé. Vous pouvez dès à présent créer des potins et les commenter"
      log_in(@user)
      redirect_to potins_path
    else
      render :new
    end
  end

  def edit
    # Méthode qui récupère le potin concerné et l'envoie à la view edit (edit.html.erb) pour affichage dans un formulaire d'édition
  end

  def update
    # Méthode qui met à jour le potin à partir du contenu du formulaire de edit.html.erb, soumis par l'utilisateur
    # pour info, le contenu de ce formulaire sera accessible dans le hash params
    # Une fois la modification faite, on redirige généralement vers la méthode show (pour afficher le potin modifié)
  end

  def destroy
    # Méthode qui récupère le potin concerné et le détruit en base
    # Une fois la suppression faite, on redirige généralement vers la méthode index (pour afficher la liste à jour)
  end
end

