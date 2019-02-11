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
		@comment = Comment.new(user: User.all.sample, content:params[:Comment_text], commenteable: Potin.find(params[:potin_id]))
		if @comment.save
			flash[:notice] = "Votre commentaire a bien été créé"
			redirect_to potin_path(params[:potin_id])
		else 
			flash[:notice] = "Votre commentaire n'a pas bien été créé"
			redirect_to potin_path(params[:potin_id])
			
		end
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

  def destroy 
  	@comments = Comment.find(params[:id])
  	@comments.destroy
  	flash[:notice] = "Ce commentaire a bien été supprimé"
  	redirect_to potins_path
  end

end
