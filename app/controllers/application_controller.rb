require_relative '../../config/environment'
require 'pry'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

<<<<<<< HEAD
  get '/posts/new' do 
    
    erb :new
  end
  

  post '/posts' do
    @name = params[:name]
    @content = params[:content]
    @post = Post.create(name:@name,content:@content)
    
    redirect to '/posts'
  end   

  get '/posts' do
    @posts = Post.all
    erb :index
  end 

  get '/posts/:id' do
    @post = Post.find_by_id(params[:id])
    
    erb :show 
  end 

  get '/posts/:id/edit' do
     @post = Post.find_by_id(params[:id])
    erb :edit 
  end 

  patch '/posts/:id' do
    @post = Post.find_by_id(params[:id])
    @post.update(params[:edit_post])
    @post.save
    erb :show
  end

  delete '/posts/:id/delete' do
    @post = Post.find(params[:id])
    @post.delete
    erb :delete
=======
  get '/posts/new' do #loads new form
    erb :new
  end

  post '/posts' do  #creates a post
    @post = Post.create(params)
    redirect to '/posts'
  end

  get '/posts' do #loads index page
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do  #loads show page
    @post = Post.find_by_id(params[:id])
    erb :show
  end

  get '/posts/:id/edit' do #loads edit form
    @post = Post.find_by_id(params[:id])
    erb :edit
>>>>>>> f6be36ed8ace48035353d6ad663efb02d3c8fda3
  end

  patch '/posts/:id' do  #updates a post
    @post = Post.find_by_id(params[:id])
    @post.name = params[:name]
    @post.content = params[:content]
    @post.save
    erb :show
  end


  delete '/posts/:id/delete' do #delete action
    @post = Post.find_by_id(params[:id])
    @post.delete
    erb :deleted
  end


end