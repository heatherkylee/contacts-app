json.id @contact1.id
json.first_name @contact1.first_name
json.last_name @contact1.last_name
# json.phone_number @contact1.phone_number
json.phone_number @contact1.japan_country_code
json.email @contact1.email
json.updated_at @contact1.updated_at

json.formatted do
  json.month_day_year @contact1.month_day_year #formatted date for when contact was last updated
  json.full_name @contact1.full_name
end