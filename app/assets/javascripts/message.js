$(function(){
  function buildMESSAGE(message) {
    var m = moment(message.created_at);
    var html ={}
    html.name = $(`<li class="message">`).append(`<div class="chat-main__contents__name">${message.name}</div>`)
    html.created_at = $(`<li class="message">`).append(`<div class="chat-main__contents__time">${m.format("YYYY年MM月DD日 HH時mm分")}</div>`)
    html.body = $(`<li class="message">`).append(`<div class="chat-main__contents__message">${message.body}</div>`)
    html.image = $(`<li class="message">`).append(`<div class="chat-main__contents__image">${message.image}</div>`)
    if($(message.image).length){
      $('.chat-main__contents').append(html.name, html.created_at, html.body, html.image);
    } else {
      $('.chat-main__contents').append(html.name, html.created_at, html.body);
    }

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
      buildMESSAGE(data)
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
