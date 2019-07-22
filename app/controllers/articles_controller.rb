class ArticlesController < ApplicationController

 http_basic_authenticate_with name: "igor", password: "123456", except: [:index, :show]

def set_post
      @post = Post.friendly.find(params[:id])
    end
def index
@articles=Article.all
end

def show
@article=Article.friendly.find(params[:id])
end
def new
	@article=Article.new
end

def edit
@article=Article.friendly.find(params[:id])
end

def create
#render plain: params[:article].inspect
@article=Article.new(article_params)
#@article.slug=Translit.convert(@article.title, :english).tr('^" "A-Za-z0-9' , '').downcase.gsub(' ','-')
if @article.save
redirect_to @article
else
	render 'new'
end
end

def update
@article = Article.friendly.find(params[:id])
if @article.update(article_params)
	redirect_to @article
else
	render 'edit'
end
end

def destroy
  @article = Article.friendly.find(params[:id])
  @article.destroy
 
  redirect_to articles_path
end


 
private 
def article_params
params.require(:article).permit(:title, :text, :slug)
end


end
