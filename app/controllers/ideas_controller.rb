class IdeasController < ApplicationController

    def index
       @ideas = Idea.all.order(created_at: :desc)
    end

    def show
       @idea = Idea.find params[:id]

    end

    def new
        @idea = Idea.new 
        # if you leave empty, by default, it will: render :new
    end

    def create
        # res.send(req.body)
        # The `params` object is availabe in controllers. It contains
        # the form's data, url params and query params.
        # To compare with Express, it's a combination of
        # req.body, req.query and req.params.
        # render json: question_params
    
        @idea = Idea.new idea_params
        if @idea.save
          redirect_to idea_path(@idea.id)
        else
          render :new
        end
    end


    def edit
        @idea = Idea.find params[:id]

    end


    def update
        @idea = Idea.find params[:id]

        @idea.update(idea_params)
        redirect_to ideas_path
    end


    def destroy
        @idea = Idea.find params[:id]

          @idea.destroy
          redirect_to ideas_path
    
    end
    


    private
    def idea_params
    params.require(:idea).permit(:title, :description)
    end


end
