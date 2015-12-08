class BooksController < ApplicationController
  
  def new
    @books = Book.new
  end

  def show
    @books = Book.find(params[:id])
  end
  
  def create
    @books = current_user.books.build(book_params)
    if @book.save
      flash[:success] = "レシピを投稿しました。"
      redirect_to current_user
    else
      @feed_books = current_user.feed_books.includes(:user).order(created_at: :desc)
      render 'users/show'
    end
  end
  
  def destroy
    @books = current_user.book.find_by(id: params[:id])
    return redirect_to root_url if @book.nil?
    @book.destroy
    flash[:success] = "投稿を削除しました。"
    redirect_to request.referrer || root_url
  end
  
  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path , notice: '編集を保存しました'
    else
      render 'edit'
    end
  end
end
