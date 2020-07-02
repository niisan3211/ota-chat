$(function(){
  function buildHTML(comment){
    let text = comment.comment.replace(/\n|\r\n|\r/g, '<br>');
    let html = `<div class="show-comment__comment__box">
                  <div class="show-comment__comment__box__comment">
                    ${text}
                  </div>
                  <div class="show-comment__comment__box__user_name">
                    by: ${comment.user_name}
                  </div>
                </div>`
   return html;
  }
  $('#comment_form').on('submit',function(e){
    e.preventDefault();
    let formData = new FormData(this);
    // FromData => フォームのデータの送信に使用することができます。その他にも、キーのついたデータを伝送するためにフォームとは独立して使用することもできます
    let url = $(this).attr('action')
    // attr() => 要素が持つ指定の属性を返す
    // 今回の場合はthisの中のaction属性の部分（URL）を返す
    $.ajax({
      // afax => 非同期通信の意味
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
      // processData => dataに指定したオブジェクトをクエリ文字列に変換する
      // contentType => サーバにデータにファイル形式を伝える
      // ajaxのリクエストがFormDataのときはどちらの値も適切な状態で送ることが可能なため、falseにすることで設定が上書きされることを防ぐ
    })
    
    .done(function(data){
      console.log(data)
      let html = buildHTML(data);
      console.log(html)
      $('.show-comment__comment').append(html);
      $('.show-comment__footer__box').val('');
      $('.show-comment__footer__submit').prop('disabled', false);
      // ↑送信ボタンを連続で押せるようにしている
    })
    .fail(function(){
      alert('error');
    })
  })
});