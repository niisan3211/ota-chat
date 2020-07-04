$(function(){
  function MemberSearch(user,id){
    let html = `<li class="group-new__contents__main__top__right__box__list__li">　${user.name}　<div id="search_name" data-user-id="${user.id}" data-user-name="${user.name}" href="/genrus/${id}/groups/new">追加</div></li>`;
    $(".group-new__contents__main__top__right__box__list").append(html);
  }

  function NotMemberSearch(){
    let html = `<li class="group-new__contents__main__top__right__box__list__li">
                  ユーザーが見つかりません
                </li>`;
    $(".group-new__contents__main__top__right__box__list").append(html);
  }

  function Member(username,id){
    let html = `<li class="group-new__contents__main__top__right__box__member_list__li" user_id=${id}>　${username}　<div id="member_name">削除</div></li>`;
    $(".group-new__contents__main__top__right__box__member_list").append(html);
  }

  function NotMember(){
    let html = `<li class="group-new__contents__main__top__right__box__member_list__li">
                  ユーザーが見つかりません
                </li>`;
    $(".group-new__contents__main__top__right__box__member_list").append(html);
  }

  $("#group_member").on("keyup",function(){
    let input = $("#group_member").val();
    let ID = $(this).attr("genru_id")
    let url = `/genrus/${ID}/groups/new`
    
    $.ajax({
      type: "GET",    //HTTPメソッド
      url: url,       //groups_controllerの、newアクションにリクエストの送信先を設定する
      dataType: 'json',
      data: {keyword: input},   //テキストフィールドに入力された文字を設定する
    })

    .done(function(users) {
      $(".group-new__contents__main__top__right__box__list").empty();
      if (users.length !== 0) {
        users.forEach(function(user) {
          MemberSearch(user,ID);
        });
      } else if (input.length == 0) {
        return false;
      } else {
        NotMemberSearch();
      }
      
    })
    .fail(function() {
      alert("通信エラーです。ユーザーが表示できません。");
    });
  });
  $(document).on("click","#search_name",function(){
    let UserId = $(this).attr("data-user-id")
    let UserName = $(this).attr("data-user-name")
    Member(UserName,UserId)
    $(this)
    .parent()
    .remove();
  });
  $(document).on("click","#member_name",function(){
    $(this)
    .parent()
    .remove();
  });
});