$(function(){
  var html = {}
  function appendList(user){
    html.name = $('<li class="chat-group-user clearfix" data-user_id=' + user.id + ' data-user_name=' + user.name + '>').append('<p class="chat-group-user__name">' + user.name + '</p>')
    html.btn = $(html.name).append('<div class="chat-group-user__btn chat-group-user__btn--add"> 追加</div>')
    $('#user-search-result').append(html.name)
  }

  $('#user-search-field').on('keyup', '.chat-group-form__input', function(e){
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
      $('#user-search-result').find('.chat-group-user').remove();
      $(data).each(function(i, user){
        appendList(user)
      });
    })
  });

  $("#user-search-result").on('click', '.chat-group-user__btn--add', function(){
    var user_id = $(this).parent('.chat-group-user').data('user_id');
    var user_name = $(this).parent('.chat-group-user').data('user_name');
    $(this).parent('.chat-group-user').hide();
    var chat_member = '<div class="chat-group-user clearfix"><input type=hidden name="group[user_ids][]" value=' + user_id + '></input><p class="chat-group-user__name">' + user_name + '</p><div class="chat-group-user__btn chat-group-user__btn--remove"> 削除</div></div>'
    $('#chat-group-users').append(chat_member)
  });

  $('#chat-group-users').on('click', '.chat-group-user__btn--remove', function(){
    $(this).parent('.chat-group-user').remove();
  });
});
