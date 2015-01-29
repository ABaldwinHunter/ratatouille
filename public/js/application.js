$(document).ready(function() {
  $('.login-link').on('click', function(event){
    var $target = $(event.target)
    event.preventDefault();
    $.ajax({
      url: "/login",
      type: "GET"
    }).done(function(response){
      // $target.append(response);
      $('#login-toolbar').replaceWith(response);
    })
  });

  $('.signup-link').on('click', function(event){
    var $target = $(event.target)
    event.preventDefault();
    $.ajax({
      url: "/signup",
      type: "GET"
    }).done(function(response){
      // $target.append(response);
      $('#login-toolbar').replaceWith(response);
    })
  });

    $('.container').on('submit', 'form.delete_recipe', function (event) {
    event.preventDefault();
    var $target = $(event.target);
    $.ajax({
      url: $target.attr('action'),
      type: 'DELETE'
    }).done(function(response) {
      $target.closest('tr').remove();
    });
  });
});
