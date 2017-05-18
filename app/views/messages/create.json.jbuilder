json.name @message.user.name
json.created_at @message.created_at
json.body @message.body
json.image image_tag @message.image.thumb.url if @message.image.present?
