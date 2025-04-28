class OwnedBooksController < ApplicationController
  def index
    @owned_books = OwnedBook.all
  end
end
