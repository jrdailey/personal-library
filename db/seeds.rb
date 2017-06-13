authors = Author.create([
    { first_name: 'Stephen', last_name: 'King' },
    { first_name: 'Jon', last_name: 'Ronson' },
    { first_name: 'J.R.R', last_name: 'Tokien'}
])

genres = Genre.create([
    { name: 'Horror' },
    { name: 'Journalism' },
    { name: 'Fantasy' }
])

Book.create(title: 'IT', author: authors[0], status: 'Owned', have_read: true, genre: genres[0])
Book.create(title: 'The Men Who Stare at Goats', author: authors[1], status: 'Lent', loaner_borrower: 'Frank', have_read: true, genre: genres[1])
Book.create(title: 'The Hobbit', author: authors[2], status: 'Borrowed', loaner_borrower: 'Library', have_read: false, genre: genres[2])
