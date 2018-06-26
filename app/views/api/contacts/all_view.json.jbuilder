json.array! @contacts.each do |contact|
  json.first_name contact.first_name
  json.last_name contact.last_name
  json.phone_number contact.phone_number
  json.email contact.email
end