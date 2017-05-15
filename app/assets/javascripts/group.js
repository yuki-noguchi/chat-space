$(function(){
  function buildRESULT(inputs){
    var html = {}
    $('.chat-group-user').remove();
    $(inputs).each(function(i, input){
      html.name = $('<li class="chat-group-user clearfix">').append('<p class="chat-group-user__name">' + input.name + '</p>')
      html.btn = $(html.name).append('<div class="chat-group-user__btn chat-group-user__btn--add"> 追加</div>')
      $('#user-search-result').append(html.name, html.btn)
    });
    // $(document).on('click', '.chat-group-user__btn--add', function(){
    //   $('.chat-group-user').remove();
    // });
  }

  $(document).on('keyup', '.chat-group-form__input', function(e){
    e.preventDefault();
    var input = $.trim($(this).val());
    $.ajax({
      url: '/users/search',
      type: 'GET',
      data: ('keyword=' + input),
      processData: false,
      contentType: false,
      dataType: 'json'
    })
    .done(function(data){
      buildRESULT(data)
    })
  });
});
