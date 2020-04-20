
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect to "/articles"
  end

  #the index
  get '/articles'
  @article = Article.all
    erb :index
  end

  #the new
  get '/articles/new' do
    @article = Article.new
    erb :new
  end

  #show
  get '/articles/:id' do
    @articles = Article.find(params[:id])
    erb :show
  end

  #post and create
  post '/articles' do
    @article = Article.create(params)
    redirect to "/articles/#{@article.id}"
  end








end
