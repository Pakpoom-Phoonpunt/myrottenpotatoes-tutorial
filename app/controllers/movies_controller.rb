class MoviesController < ApplicationController
    def index
        @movies = Movie.all()
    end

    def show
        @movie = Movie.where(:id => params[:id])[0]
    end

    def new
        @movie = Movie.new()
    end
    def create
        params.require(:movie)
        new_movie  = params[:movie].permit(:title,:rating,:release_date)
        puts new_movie
        @movie = Movie.create!(new_movie)
        
        flash[:notice] = "#{@movie.title} was successfully created."
        redirect_to movies_path
    end
    
    def edit
        @movie = Movie.find(params[:id])
    end
      
    def update
        @movie = Movie.find(params[:id])
        # params.require(:movie)
        @movie.update!(params[:movie].permit(:title,:rating,:release_date))
        flash[:notice] = "#{@movie.title} was successfully updated."
        redirect_to movie_path(@movie)
    end

    def destroy
        @movie = Movie.find(params[:id])
        @movie.destroy()
        flash[:notice] = "#{@movie.title} was Deleted."
        redirect_to movies_path
    end

    # private
    # def movies_params
    #     params[:movie].permit(:title,:rating,:release_date)
    # end
end