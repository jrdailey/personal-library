$(function() {
  var initialize = function() {
        $('#add-author-link').click(function(e) {
          e.preventDefault();

          $('#author-prompt').load('/authors/new #new-author-form', setUpAuthorPromptFormFields);
        });

        $('#add-genre-link').click(function(e) {
          e.preventDefault();

          $('#genre-prompt').load('/genres/new #new-genre-form', setUpGenrePromptFormFields);
        });
      },
      reloadAuthorSelect = function() {
        var loadDef = $.Deferred();

        $('#author-prompt').load('/books/new #author-prompt', function() {
          initialize();
          loadDef.resolve();
        });

        return loadDef.promise();
      },
      reloadGenreSelect = function() {
        var loadDef = $.Deferred();

        $('#genre-prompt').load('/books/new #genre-prompt', function() {
          initialize();
          loadDef.resolve();
        });

        return loadDef.promise();
      },
      setUpAuthorPromptFormFields = function() {
        $('#new-author-form').submit(function(e) {
          e.preventDefault();

          $.post('/authors.html', $(this).serialize())
            .done(function(data) {
              reloadAuthorSelect().done(function() {
                $('#book_author_id').val(data.id);
              });
            });
        });

        $('.cancel-add-author').click(function(e) {
          e.preventDefault();

          reloadAuthorSelect();
        });
      },
      setUpGenrePromptFormFields = function() {
        $('#new-genre-form').submit(function(e) {
          e.preventDefault();

          $.post('/genres.html', $(this).serialize())
            .done(function(data) {
              reloadGenreSelect().done(function() {
                $('#book_genre_id').val(data.id);
              });
            });
        });

        $('.cancel-add-genre').click(function(e) {
          e.preventDefault();

          reloadGenreSelect();
        });
      };

  initialize();
});
