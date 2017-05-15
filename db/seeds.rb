authors = Author.create([
    { first_name: 'Stephen', last_name: 'King' },
    { first_name: 'Jon', last_name: 'Ronson' }
])

genres = Genre.create([
    { name: 'Horror' },
    { name: 'Journalism' }
])

Book.create(title: 'IT', author: authors[0], status: 'Owned', have_read: true, genre: genres[0])
Book.create(title: 'The Men Who Stare at Goats', author: authors[1], status: 'Lent', loaner_borrower: 'Sammi', have_read: true, genre: genres[1])
