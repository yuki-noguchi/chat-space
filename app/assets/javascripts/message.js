$(function(){
  function buildMESSAGE(message) {
    var m = moment(message.created_at);
    var html ={}
    html.name = $(`<div class="chat-main__contents__name">`).append(message.name)
    html.created_at = $(`<div class="chat-main__contents__time">`).append(m.format("YYYY年MM月DD日 HH時mm分"))
    html.body = $(`<div class="chat-main__contents__message">`).append(message.body)
    html.image = $(`<div class="chat-main__contents__image">`).append(message.image)
    if(message.image){
      var appendList = $('<li class="message" data-message-id="${message.id}">').append(html.name, html.created_at, html.body, html.image);
    } else {
      var appendList = $('<li class="message" data-message-id="${message.id}">').append(html.name, html.created_at, html.body);
    }
    $('.chat-main__contents').append(appendList);
  }

  function buildGROUP(message) {
    var group_id = message.group_id
    $('[data-group-id=' + group_id + ']').text(message.body)
  }

  $(document).on('submit', '#message_form', function(e){
    e.preventDefault();
    var formData = new FormData($('#message_form').get(0));
    var text = $('.text');
    $.ajax({
      url: location.href,
      type: 'POST',
      data: formData,
      processData: false,
      contentType: false,
      dataType: 'json'
    })
    .done(function(data){
      buildMESSAGE(data);
      buildGROUP(data);
      $('.notification').text("メッセージの送信に成功しました")
      text.val('');
      $('.send-btn').prop('disabled', false)
    })
    .fail(function(){
      $('.notification').text("メッセージを入力してください")
      $('.send-btn').prop('disabled', false)
    });
  });

});
