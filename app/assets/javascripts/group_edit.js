$(function(){
  function GroupNotMember(member){
    let html =`<div class="members">
                <input name="group[user_group][ids][]" type="hidden" value="0"><input type="checkbox" value="{:checked_value=>${member.id}, :unchecked_value=>false}" name="group[user_group][ids][]" id="not_checked_member",data-member-id="${member.id},data-member-name=${member.name}">
                <label id="not_membername">${member.name}</label>
              </div>`
    $(".not_members").append(html);
  }

  $("#members").on("keyup",function(){
    let input = $("#members").val();
    let GenruID = $(this).attr("genru_id")
    let GroupID = $(this).attr("group_id")
    let url = `/genrus/${GenruID}/groups/${GroupID}/edit`

    $.ajax({
      type: "GET",
      url: url,
      dataType: 'json',
      data:{keyword: input}
    })
    .done(function(members){
      $(".not_members").empty();
      if (members.length != 0) {
        members.forEach(function(member){
          console.log(members)
          console.log(member)
          GroupNotMember(member)
        });
      } else if (input.length == 0) {
        return false;
      } else{

      }
    })
    .fail(function() {
      alert("通信エラーです。ユーザーが表示できません。");
    });
  })

  $(document).ready(function(){
    $('#group_tag').tagit();
  })
  
});