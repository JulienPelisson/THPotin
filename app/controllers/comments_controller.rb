class CommentsController < ApplicationController
	def index
		@comments = Comment.find(params[:id])
	end
	def new
		@comment = Comment.new
		redirect_to potins_path
	end

	def show
		@comments = Comment.all
	end

	
	def create
		@comments = Comment.new(user: params[:User_text], content:params[:content])
		
		puts @comments.errors.full_messages

		@comments.save
		flash[:notice] = "Votre commentaire a bien été créé"
		redirect_to potins_path

	end



	def edit
		@comments = Comment.find(params[:id])
	end
  # Méthode qui récupère le commentaire concerné et l'envoie à la view edit (edit.html.erb) pour affichage dans un formulaire d'édition


  def update
  	@comments = Comment.find(params[:id])
  	post_params = params.require(:comment).permit(:content)
  	@comments.update(post_params)
  	redirect_to potins_path
  end
end
