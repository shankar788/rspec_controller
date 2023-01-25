class BooksController < ApplicationController
  def index
    @books_variable = Book.all
    render json:@book
  end

  def create
    book = Book.new(book_params)
   if book.save
    render json:book,status: :ok
   else
    render json:book.errors,status: :unprocessable_entity
   end
  end

  def show
  end

  def update
  end

  def destroy
    
    @book = Book.find(params[:id])
    render json:@book if @book.destroy
  end
  
  def book_params
    params.require(:book).permit(:name)
  end  


end
