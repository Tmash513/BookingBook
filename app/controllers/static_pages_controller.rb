class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @books = current_user.books.build
      @feed_items = current_user.feed_items.includes(:user).order(created_at: :desc)
    end
  end
end
