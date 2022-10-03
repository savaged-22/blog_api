class PostsController < ApplicationController
    def index
        @posts = Post.where(published: true)
        render json: @posts, status: :ok
    end


    def show
        @posts = Post.find(params[:id])
        render json: @json, status: :ok
    end




end