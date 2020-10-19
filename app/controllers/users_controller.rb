class UsersController < ApplicationController

  before_action :authenticate_user!

  def index
    @users = User.all
    @book = Book.new
    @user = User.find(current_user.id)

    # if @book_new.save
    #   redirect_to book_path(book.id)
    # else
    #   render :index
    # end
  end

  def show
    @book = Book.new
    # 自分の投稿だけと言う制限が必要
    # プロフ表示用
    @user = User.find(params[:id])
    # @user = User.find()
    @books = @user.books
    # @books = Book.all
  end

  def edit
    @user = User.find(params[:id])
    correct_user(@user)
  end

  # def update
  #   @user = User.new(post_image_params)
  #   @user.id = current_user.id
  #   @user.save
  #   redirect_to user_path
  # end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params) #（）内の指定の意味はprivate内のuser_paramsのpermit内を引き出している
        flash[:notice] = "User was successfully updated."
        redirect_to user_path(@user)
    else
        render :edit
    end
  end


# ユーザは消すんじゃなくてログアウトしたいだけなのでdestroyいらないかも?
  # def destroy
  #   user = User.find(params[:id])
  #   user.destroy
  #   redirect_to homes_show_path
  # end

  def user_params
      params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def correct_user(user)
    if current_user.id != user.id
      redirect_to users_path
    end
  end


end
