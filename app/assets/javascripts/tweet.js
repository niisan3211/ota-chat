$(function(){
  let nextInput = function(index){
    let html = `<label class="new-message__main__image__link">
                  <div class="data_index" data-index="${index}">
                    <input class="js-file" type="file" name="tweet[images_attributes][${index}][src]" id="tweet_images_attributes_${index}_src" style="display:none">
                    <i class="far fa-images fa-2x" style="display:none"></i>
                    
                  </div>
                </label>`;
    return html;
  }

  let previewImages = function(index, url) {
    let html = `<img data-index="${index}" src="${url}" width="100px" height="100px">
                <div class="js-remove" data-remove-index="${index}">削除する</div>`;
    return html;
  }

  // file_fieldのnameに動的なindexをつける為の配列
  let fileIndex = [1,2,3,4,5,6,7,8,9,10];

  // let resetcount = $(".js-remove").length;
  // console.log(resetcount)
  // if (resetcount == 0){
  // }else if (resetcunt >= 10) {
  //   $('.new-message__main__image__link').addClass("resetcunt");
  // } else if (resetcunt < 10) {
  //   $('.new-message__main__image__link').addClass("resetcunt");
  //   $('.new-message__main__image__upload').append(nextInput(fileIndex[0]));
  // }


  $('.new-message__main__image').change('js-file', function(e){
    // fileIndexの先頭の数字を使ってinputを作る
    $('.new-message__main__image_link').append(nextInput(fileIndex[0]));
    fileIndex.shift();
    // 末尾の数に1足した数を追加する
    fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
  });
  $('.new-message__main__image').on('change', '.js-file', function(e) {
    let targetIndex = $(this).parent().data('index');
    // ファイルのブラウザ上でのURLを取得する
    let file = e.target.files[0];
    let blobUrl = window.URL.createObjectURL(file);
    // ↑(URL.createObjectURL() => 引数で指定されたオブジェクトを表す URLを生成する)

    // ↓新規画像追加の処理
    $('#previews').append(previewImages(targetIndex, blobUrl));
    // fileIndexの先頭の数字を使ってinputを作る
    $('.new-message__main__image__upload').append(nextInput(fileIndex[0]));
    fileIndex.shift();
    // 末尾の数に1足した数を追加する
    fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
  });
  $('.new-message__main__image').on('click','.js-remove',function(){
    let targetIndex = $(this).data("remove-index")
    console.log(targetIndex)
    $(`img[data-index="${targetIndex}"]`).remove();
    $(`div[data-remove-index="${targetIndex}"].js-remove`).remove();
    // $(`div[data-index="${targetIndex}"].data-index`).remove();
    
    // let hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
    // hiddenCheck.prop('checked', true)
  });
});


{/* <input class="hidden-destroy" data-index="${index}" type="checkbox" name="tweet[images_attributes][${index}][_destroy]" id="tweet_images_attributes_${index}__destroy"></input> */}