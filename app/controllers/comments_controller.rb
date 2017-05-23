class CommentsController < ApplicationController

    def create 
        @article = Article.find(params[:article_id])
        @comment = @article.comments.create(comment_params)

        if @comment.save
            redirect_to article_path(@article)
        else
            render 'new'
        end
     end

     def edit
         @article = Article.find(params[:article_id])
         @comment = @article.comments.find(params[:id])
     end

     def destroy
     end    

     def update
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
end
