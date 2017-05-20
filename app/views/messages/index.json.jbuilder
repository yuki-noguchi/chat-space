if @new_message.present?
  json.array! @new_message do |new_message|
    json.name new_message.user.name
    json.created_at new_message.created_at
    json.body new_message.body
    json.image image_tag new_message.image.thumb.url if new_message.image.url
    json.id new_message.id
  end
end
