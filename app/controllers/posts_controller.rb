class PostsController < ApplicationController
  before_action :find_post ,except:[:index, :new, :create]
  def index
    @posts = Post.all
  end

  def show

  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    
    if @post.save
      redirect_to root_path, notice: '文章新增成功'
    else
      render :new
    end
  end

  def edit
    
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: '文章修改成功'
    else
      render :edit
    end
  end

  
  def destroy
    @post.destroy
    redirect_to root_path, notice: '文章刪除成功'
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end

    def post_params
    params.require(:post).permit(:title, :content, :category)
    # params.require(:post).permit(:title, :content, category_ids: [])

  end
end
