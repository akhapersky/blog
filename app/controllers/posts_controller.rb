class PostsController < ApplicationController
  http_basic_authenticate_with name: "poiu", password: "poiu", except: [:index, :show]
  def index
    @post = Post.all
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    #ID явно не указывали, но его можно использовать, т.к он всегда есть в БД
    # он может отобразить её в html
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if(@post.update(post_params))
      redirect_to @post
    else
      render 'edit' #просто перезагрузка странички!
    end
  end

  def create
    #render отладчик для проверки данных
    #render plain: params[:post].inspect
    @post = Post.new(post_params)
    #можем сохранить, если пройдена валидация
    #@post.save
    if(@post.save)
      redirect_to home_path
    else
      render 'new' #просто перезагрузка странички!
    end
    #resirect: передаёт сам метод в show:
  end

  #метод который определяет какие поля можно передавать.
  private def post_params
    params.require(:post).permit(:title, :body)
  end

end
