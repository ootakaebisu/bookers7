class BooksController < ApplicationController

  before_action :authenticate_user!

  def index
    @book = Book.new
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    @book_new = Book.new
  end

  def new
    @book = Book.new
    # @book_new = Book.new
  end

  def create
    @book = Book.new(book_params)
    # {Book: title:"たいとる", body: "ボディ", user_id: nil.....}
    @book.user_id = current_user.id
    # {User: id:1, email: "e@e", name: "なまえ"........}
    # {Book: title:"たいとる", body: "ボディ", user_id: 1.....}
    if @book.save
        flash[:notice] = "Book was successfully created."
        redirect_to book_path(@book)
    else
        #indexアクションと同じ
        @books = Book.all
        render :index
    end
  end

  # if @book_new.save
  #     redirect_to book_path(book.id)
  #   else
  #     render :index
  # end

  def edit
    @book = Book.find(params[:id])
    correct_book(@)
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params) #（）内の指定の意味はprivate内のbook_paramsのtitle とbobyを引き出している
        flash[:notice] = "Book was successfully updated."
        redirect_to book_path(@book)
    else
        @books = Book.all
        render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

private
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
  def correct_book(book)
    if current_user.id != book.user.id
      redirect_to books_path
    end
  end
end
