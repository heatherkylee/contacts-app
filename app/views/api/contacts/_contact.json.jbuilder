json.id contact.id
json.first_name contact.first_name
json.middle_name contact.middle_name
json.last_name contact.last_name
# json.phone_number @contact1.phone_number
json.phone_number contact.japan_country_code
json.email contact.email
json.bio contact.bio
json.group contact.groups
json.updated_at contact.updated_at

json.formatted do
  json.month_day_year contact.month_day_year #formatted date for when contact was last updated
  json.full_name contact.full_name
end