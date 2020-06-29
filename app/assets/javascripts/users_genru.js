$(function(){
  function favoriteId
  function favoriteIcon(genru_id){
    let html = `<div id="favorite_link">
                  <a data-remoto="true" id="favorite_genru" rel="nofollow" data-method="delete" href="/genrus/3/users_genrus">
                    <i class="fas fa-star fa-2x favoriteGenru"></i>
                  </a>
                </div>`

  }
  $('.right__main__post__bottom__other__like').click(function(e){
    console.log(this)
    let Data = this;
    let url = $('#favorite_link').
    console.log(Data)
    console.log(url)
    e.preventDefault();
    e.stopPropagation();
    // 上の二つがないとconsole.log()で中身が見られない
    
    
    // let url = $('#favorite_link').attr('href')
    // $.ajax({
    //   url: url,
    //   type: 'DELETE',
    //   data: formData,
    //   dataType: 'json',
    //   processData: false,
    //   contentType: false
    // })

    // .done(function(data){
    //   console.log(data)
    // })
    // .fail(function(){

    // })

  })
});