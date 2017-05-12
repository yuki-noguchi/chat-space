$(function(){
  function buildMESSAGE(message) {
    var m = moment(message.created_at);
    var html =
    '<li class="message">'
    + '<div class="chat-main__contents__name">'
    + $('.chat-main__contents__name').html()
    + '</div>'
    + '<div class="chat-main__contents__time">'
    + m.format("YYYY年MM月DD日 HH時mm分")
    + '</div>'
    + '<div class="chat-main__contents__message">'
    + message.body
    +'</div>'
    + '</li>'
    $('.chat-main__contents').append(html);
  }

  $(document).on('submit', '#message_form', function(e){
    e.preventDefault();
    // var $form = $(this)
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
      group_id = data.group_id
      $('[data-group-id=' + group_id + ']').text(data.body)
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
