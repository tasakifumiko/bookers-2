class BooksController < ApplicationController
before_action :current_user, only: [:edit, :update, :destroy]
  
  def new
    @book = Book.new
  end
  
  def create
    @book = current_user.books.build(book_params)
    @book = Book.new(book_params)
    @book.user = current_user
    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to books_path(@book)
    else
      @books = Book.all
      render("books/index")
    end
  end
  
  def edit
    @book = Book.find(params[:id])
    @user = @book.user
  end
  
  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
  end
  
  def update
    @book = Book.find(params[:id])
    
    if @book.update(book_params)
      flash[:notice] =  "Book was successfully updated."
      redirect_to book_path(@book.id)
    else
      @book = book
      render("books/edit")
    end
  end
  

  
  
  def destroy
    @book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end
  
  
  private

  def book_params
    params.require(:book).permit(:title, :profile_image, :body)
  end

  def user_params
    params.require(:user).permit(:name, :introduction)
  end
end



