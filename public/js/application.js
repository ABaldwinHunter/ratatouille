$(document).ready(function() {
  $('.login-link').on('click', function(event){
    var $target = $(event.target)
    event.preventDefault();
    $.ajax({
      url: "/login",
      type: "GET"
    }).done(function(response){
      $('.welcome').append(response);
      $('#login-toolbar').remove();
    })
  });

  $('.signup-link').on('click', function(event){
    var $target = $(event.target)
    event.preventDefault();
    $.ajax({
      url: "/signup",
      type: "GET",
    }).done(function(response){
      $('.welcome').append(response);
      $('#login-toolbar').remove();
    })
  });
    $('.container').on('submit', 'form.delete_recipe', function (event) {
    event.preventDefault();
    var $target = $(event.target);
    $.ajax({
      url: $target.attr('action'),
      type: 'DELETE',
      data: $target.serialize(),
    }).done(function(response) {
      $target.closest('tr').remove();
    });
  });


    console.log('$(form.delete_favorite)', $('form.delete_favorite'));

    $('form.delete_favorite').on('submit', function (event) {
    event.preventDefault();
    var $target = $(event.target);
    $.ajax({
      url: $target.attr('action'),
      type: 'DELETE',
      data: $target.serialize(),
    }).done(function() {
      $target.closest('tr').remove();
      alert("deleted favorite!");
    });
  });
    $('.container').on('submit', 'form.add_favorite', function (event) {
    event.preventDefault();
    var $target = $(event.target);
    $.ajax({
      url: $target.attr('action'),
      type: 'POST',
      data: $target.serialize(),
    }).done(function() {
      alert("Successfully added to favorites!");
    });
  });
});
