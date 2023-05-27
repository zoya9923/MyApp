class BooksController < ApplicationController
    before_action :get_book, only: [:show, :update, :destroy, :publish_book]
def create
    book = current_user.books.new(book_params)
    if book.save
        render json: book
    else
        render json: {error: 'Book not inserted'}
    end
end

def index
    books = current_user.books
    render json: books
end

def show
    #book = current_user.books.find_by(id: params[:id])
    if @book.present?
        render json: @book
    else 
        render json: {error: 'book not found'}
    end
end

def update
   # book = current_user.books.find_by(id: params[:id])
    if @book.present?
        @book.update(book_params)
        render json: {message: 'book updated'}
    else
        render json: {error: 'book not found for update'}
    end
end

def destroy
   # book = current_user.books.find_by(id: params[:id])
    if @book.present?
        @book.destroy
        render json: {message: 'book id deleted'}
    else
        render json: {error: 'book not found for delete'}
    end
end

def publish_book
   if @book.present?
    @book.update_columns(status: "published")
    render json: @book, message:'Book is published'
    else
        render json: {error: 'book not found'}
    end

end

def all_publish_book
    all_book = Book.where(status: "published")
    render json: all_book
end

def all_draft_book
    all_book = Book.where(status: "draft")
    render json: all_book
end


private
def book_params
    params.require(:books).permit(:title, :description, :user_id)
end

def get_book
    @book = current_user.books.find_by(id: params[:id])
end



end
