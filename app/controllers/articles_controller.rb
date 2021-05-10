class ArticlesController < ApplicationController
  
  load_and_authorize_resource
  before_action :authenticate_user!
  
  # http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]
  
  
  def index
    @articles = Article.all
  end


  def show
      @article = Article.find(params[:id])
  end


    def new
      @article = current_user.articles.build
    end
  

    
    def create
      @article = current_user.articles.build(article_params)

      if @article.save
        redirect_to @article
      else
        render :new
      end
    end



    
def edit
  @article = Article.find(params[:id])
end

def update
  @article = Article.find(params[:id])

  if @article.update(article_params)
    redirect_to @article
  else
    render :edit
  end
end



def destroy
  @article = Article.find(params[:id])
  @article.destroy

  redirect_to @article
end

private
    def article_params
      params.require(:article).permit(:title, :text, :status)
    end
end
