class ReviewsController < ApplicationController

    before_action :authenticate_user!, only: [:create, :destroy]
    before_action :find_review, only: [:destroy]
    before_action :authorize_user!, only: [:destroy]

    def create
        @idea = Idea.find params[:idea_id]
        @review = Review.new review_params
        # @question << @answer
        @review.idea = @idea
        @review.user = current_user
    
        if @review.save
          redirect_to idea_path(@idea)
        else
          @review = @idea.review.order(created_at: :desc)
          render "ideas/show"
        end
      end

      def destroy
        @review = Review.find params[:id]
        @review.destroy
    
        redirect_to idea_path(@review.idea.id)
      end



      private
      def review_params
        params.require(:review).permit(:body)
      end
    
      def find_review
        @review = Review.find params[:id]
      end
    
      def authorize_user!
        unless can? :crud, @review
          flash[:danger] = "Access Denied"
          redirect_to home_path
        end
      end
end
