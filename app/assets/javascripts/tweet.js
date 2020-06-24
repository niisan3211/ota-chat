$(function(){
  let nextInput = function(index){
    let html = `<label class="new-message__main__image__link">
                  <div class="data_index" data-index="${index}">
                    <input class="js-file" type="file" name="tweet[images_attributes][${index}][src]" id="tweet_images_attributes_${index}_src" style="display:none">
                    <i class="far fa-images fa-2x"></i>
                    
                  </div>
                </label>`;
    return html;
  }

  let previewImages = function(index, url) {
    let html = `<div>
                  <img data-index="${index}" src="${url}" width="100px" height="100px">
                  <div class="js-remove" data-remove-index="${index}">削除する</div>
                </div>`;
    return html;
  }

  // file_fieldのnameに動的なindexをつける為の配列
  let fileIndex = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50];

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
    let preview_count = $('.js-remove').length;

    // ↓新規画像追加の処理
    $('#previews').append(previewImages(targetIndex, blobUrl));
    // fileIndexの先頭の数字を使ってinputを作る
    $('.new-message__main__image__upload').append(nextInput(fileIndex[0]));
    fileIndex.shift();
    // 末尾の数に1足した数を追加する
    fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
    console.log(preview_count)
    // ↓画像が５枚（preview_count => 4）になったら、アイコンを消して投稿ができないようにする
    if(preview_count == 4){
      $('.far').removeClass('far');
      $('.fa-images').removeClass('fa-images');
      $('.fa-2x').removeClass('fa-2x');

    }
  });
  $('.new-message__main__image').on('click','.js-remove',function(){
    let targetIndex = $(this).data("remove-index")
    let preview_count = $('.js-remove').length;
    $(`img[data-index="${targetIndex}"]`).remove();
    $(`div[data-remove-index="${targetIndex}"].js-remove`).remove();
    console.log(`div[data-remove-index="${targetIndex}"].js-remove`)
    $(`div[data-index="${targetIndex}"].data_index`).remove();
    // ↓画像が４枚（preview_count => 3）になったら、アイコンが出現して投稿ができるようにする
    if(preview_count == 3){
      $('i').addClass('far');
      $('i').addClass('fa-images');
      $('i').addClass('fa-2x');
    }
  });
});