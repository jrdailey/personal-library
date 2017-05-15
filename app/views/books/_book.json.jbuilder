json.extract! book, :id, :title, :author_id, :genre_id, :status, :have_read, :loaner_borrower, :created_at, :updated_at
json.url book_url(book, format: :json)
