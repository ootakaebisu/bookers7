class UsersController < ApplicationController
  def top
  end

  def index
  end

  def show
    @book_new = Book.new
    # 自分の投稿だけと言う制限が必要
    @books = Book.all
    # @book.user_id = current_user.id
    # @books = @user.books.page(params[:page]).reverse_order
  end

  def edit
    @user = User.find(params[:id])
  end

  def user_params
      params.require(:user).permit(:name, :introduction, :image)
  end


end
