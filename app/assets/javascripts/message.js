$(function(){
  function MessageForm(message){
    if (message.message && message.message_image){
      var html = `<div class="group-index__contents__chat__main__individual">
                    <p class="group-index__contents__chat__main__individual__name">
                      <img src="${message.user_icon}" width="50" height="50">
                      ${message.user_name}
                    </p>
                    <p class="group-index__contents__chat__main__individual__created">
                      ${message.created_at}
                    </p>
                    <div class="group-index__contents__chat__main__individual__box">
                      <div class="group-index__contents__chat__main__individual__box__message">
                        ${message.message}
                      </div>
                      <div class="group-index__contents__chat__main__individual__box__image">
                      <img src="${message.message_image}">
                      </div>
                    </div>
                  </div>`
    }else if (message.message){
      var html = `<div class="group-index__contents__chat__main__individual">
                    <p class="group-index__contents__chat__main__individual__name">
                      <img src="${message.user_icon}" width="50" height="50">
                      ${message.user_name}
                    </p>
                    <p class="group-index__contents__chat__main__individual__created">
                      ${message.created_at}
                    </p>
                    <div class="group-index__contents__chat__main__individual__box">
                      <div class="group-index__contents__chat__main__individual__box__message">
                        ${message.message}
                      </div>
                      <div class="group-index__contents__chat__main__individual__box__image">
                      </div>
                    </div>
                  </div>`
    }else if (message.message_image){
      var html = `<div class="group-index__contents__chat__main__individual">
                    <p class="group-index__contents__chat__main__individual__name">
                      <img src="${message.user_icon}" width="50" height="50">
                      ${message.user_name}
                    </p>
                    <p class="group-index__contents__chat__main__individual__created">
                      ${message.created_at}
                    </p>
                    <div class="group-index__contents__chat__main__individual__box">
                      <div class="group-index__contents__chat__main__individual__box__message">
                      </div>
                      <div class="group-index__contents__chat__main__individual__box__image">
                        ${message.message_image}
                      </div>
                    </div>
                  </div>`
    };
    return html;
  }
  $(document).on('submit','#new_message',function(e){
    e.preventDefault();
    var Data = new FormData(e.target);
    // FromData => フォームのデータの送信に使用することができます。その他にも、キーのついたデータを伝送するためにフォームとは独立して使用することもできます
    var URL = $(this).attr('action')
    $.ajax({
      url: URL,
      type: 'POST',
      data: Data,
      processData: false,
      contentType: false,
      error : function(XMLHttpRequest, textStatus, errorThrown) {
        console.log("ajax通信に失敗しました");
        console.log("XMLHttpRequest : " + XMLHttpRequest.status);
        console.log("textStatus     : " + textStatus);
        console.log("errorThrown    : " + errorThrown.message);
    },
      //ajax通信成功
      success : function(response) {
          console.log("ajax通信に成功しました");
          console.log(response)
    }
    })
    .done(function(data){
      var html = MessageForm(data);
      $(".group-index__contents__chat__main").append(html);
      // ↓スクロール用
      $(document).on('turbolinks:load', function() {
        　$('.group-index__contents__chat__main').animate({ scrollTop: $('.group-index__contents__chat__main')[0].scrollHeight});
      });
      $('form')[0].reset();
    })
    .fail(function() {
      alert("通信エラーです。ユーザーが表示できません。");
    })
    .always(() => {
      $("#group-index__contents__submit").removeAttr("disabled");
      });
  });
});