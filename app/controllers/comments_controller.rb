class CommentsController < ApplicationController
before_action :find_article
before_action :find_comment , only: [:edit, :update, :destroy]


    def create 
        @comment = @article.comments.create(comment_params)
        @comment.user_id = current_user.id

        if @comment.save!
            redirect_to article_path(@article)
        else
            flash[:error] = "Error saving the comments"
            redirect_to article_path(@article)
        end
     end

     def edit
         @article = Article.find(params[:article_id])
         @comment = @article.comments.find(params[:id])
     end

     def destroy
         @comment.destroy
         redirect_to article_path(@article)
     end    

     def update
         @comment.content =comment_params
         if @comemnt.update(comment_params)
             redirect_to article_path(@article)
         else
             render 'edit'
         end
     end                  

     private
     def comment_params
        params.require(:comment).permit(:content)
     end    

     def find_article
        @article = Article.find(params[:article_id])
     end   

     def find_comment
        @comment = @article.comments.find(params[:id])
     end   
end
