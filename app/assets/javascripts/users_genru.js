$(function(){
  function favoriteIcon(n){
    let html = `<a id="favorite_not_genru" data-genru_id="${n}" remoto="true" rel="nofollow" data-method="post" href="/genrus/${n}/users_genrus"><i class="far fa-star fa-2x favoriteGenru"></i></a>`
    return html;
  }
  function favoriteNotIcon(n){
    let html = `<a id="favorite_genru" data-genru_id="${n}" remoto="true" rel="nofollow" data-method="delete" href="/genrus/${n}/users_genrus"><i class="fas fa-star fa-2x favoriteGenru"></i></a>`
    return html;
  }
  $('#favorite_not_genru').on('ajax:success',function(e){
    e.preventDefault();
    e.stopPropagation();
    var detail = event.detail;
    var data = detail[0], status = detail[1], xhr = detail[2];
    console.log(event.originalEvent.detail[0])
  });

  // $('#favorite_not_genru').on('click',function(e){
  //   e.preventDefault();
  //   let Data = this;
  //   let genru_id = $(this).attr('data-genru_id');
  //   let url = $(this).attr('href');
  //   let val = $('#favorite_genru').val(`<i class="fas fa-star fa-2x favoriteGenru"></i>`)
  //   $.ajax({
  //     url: url,
  //     type: 'POST',
  //     data: favoriteIcon(genru_id),
  //     dataType: 'json',
  //     processData: false,
  //     contentType: false
  //   })
  //   .done(function(data){
  //     console.log(1)
  //     console.log(data)
  //     let html = favoriteIcon(url)
  //     ('#favorite_link').append(html)
  //   })
  //   .fail(function(jqXHR, textStatus, errorThrown){
  //     console.log(2)
  //     console.log("jqXHR          : " + jqXHR.status); // HTTPステータスが取得
  //     console.log("textStatus     : " + textStatus);    // タイムアウト、パースエラー
  //     console.log("errorThrown    : " + errorThrown.message); // 例外情報
  //     console.log("URL            : " + url);
  //     // console.log(data)
  //     // console.log(url)
  //     // console.log($.ajax)
  //   })
  //   // e.preventDefault();
  //   // e.stopPropagation();
  //   // 上の二つがないとconsole.log()で中身が見られない
  // })

  // $('#favorite_genru').click(function(e){
  //   e.preventDefault();
  //   Rails.fire($('#check_box').parent()[0], 'submit');
  //   let Data = this;
  //   let genru_id = $(this).attr('data-genru_id');
  //   let url = $(this).attr('href');
  //   let val = $('#favorite_genru').val(`<i class="fas fa-star fa-2x favoriteGenru"></i>`)
  //   $.ajax({
  //     url: url,
  //     type: 'DELETE',
  //     data: favoriteNotIcon(genru_id),
  //     dataType: 'json',
      
  //   })
  //   .done(function(data){
  //     console.log(1)
  //     console.log(data)
  //     let html = favoriteIcon(url)
  //     ('#favorite_link').append(html)
  //   })
  //   .fail(function(jqXHR, textStatus, errorThrown){
  //     console.log(2)
  //     console.log("jqXHR          : " + jqXHR.status); // HTTPステータスが取得
  //     console.log("textStatus     : " + textStatus);    // タイムアウト、パースエラー
  //     console.log("errorThrown    : " + errorThrown.message); // 例外情報
  //     console.log("URL            : " + url);
  //     // console.log(data)
  //     // console.log(url)
  //     // console.log($.ajax)
  //   })
  //   // e.preventDefault();
  //   // e.stopPropagation();
  //   // 上の二つがないとconsole.log()で中身が見られない

  // })
});