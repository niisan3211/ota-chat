#favorite_link
  #favorite_link{id: genru.id}
    - if @genru.users_genrus.where(user_id: current_user.id).exists?
      = link_to genru_users_genrus_path(genru.id),method: :delete,id:"favorite_genru", data:{genru_id: "#{genru.id}"},remoto: true do
        =icon("fas","star fa-2x",class: "favoriteGenru")
    - else
      = link_to genru_users_genrus_path(genru.id),method: :post,id:"favorite_not_genru", data:{genru_id: "#{genru.id}"},remoto: true do
        =icon("far","star fa-2x",class: "favoriteGenru")

        $( ('#<%= @page.id %>' ) ).html('<%= 
    j( render( 'edit_form' ) ) 
  %>');