json.message do |message|
  json.message       @message.message
  json.message_image @message.message_image
  json.user_id       @message.user_id
  json.created_at    @message.created_at

  json.user_name     @message.user.name
  json.user_icon     @message.user.icon
end
