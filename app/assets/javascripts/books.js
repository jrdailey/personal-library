$(function() {
  var oldAuthorPromptHtml = $('#author-prompt')[0].innerHTML,
      oldGenrePromptHtml = $('#genre-prompt')[0].innerHTML,
      initialize = function() {
        $('#add-author-link').click(function(e) {
          e.preventDefault();

          $('#author-prompt').load('/authors/new #new-author-form', setUpAuthorPromptFormFields);
        });

        $('#add-genre-link').click(function(e) {
          e.preventDefault();

          $('#genre-prompt').load('/genres/new #new-genre-formfields', setUpGenrePromptFormFields);
        });
      },
      setUpAuthorPromptFormFields = function() {
        $('#new-author-form').submit(function(e) {
          e.preventDefault();

          $.post('/authors.html', $(this).serialize())
            .done(function(data) {
              $('#author-prompt').html(oldAuthorPromptHtml);
              initialize();
              $('book_author_id').val(data.id);
            })
            .error(function() {
              alert('not tight');
            });
        });

        $('.cancel-add-author').click(function(e) {
          e.preventDefault();

          $('#author-prompt').html(oldAuthorPromptHtml);
          initialize();
        });
      },
      setUpGenrePromptFormFields = function() {
        $('.cancel-add-genre').click(function(e) {
          e.preventDefault();

          $('#genre-prompt').html(oldGenrePromptHtml);
          initialize();
        });
      };

  initialize();
});
