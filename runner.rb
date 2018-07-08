require 'unirest'

# #Create Action 

# p "What is the first name?"
# input_first_name = gets.chomp
# p "What is the last name?"
# input_last_name = gets.chomp
# p "What is the phone number?"
# input_phone_number= gets.chomp
# p "What is the email?"
# input_email = gets.chomp

# response = Unirest.post("http://localhost:3000/api/contacts",
#   parameters: {
#     input_first_name: input_first_name,
#     input_last_name: input_last_name,
#     input_phone_number: input_phone_number,
#     input_email: input_email
#   }
# )

# p response.body

#Update Action

# p "What contact would you like update?"
# contact_id = gets.chomp.to_i
# response = Unirest.patch("http://localhost:3000/api/contacts/#{contact_id}",
#   parameters: {
    # input_first_name: "",
    # input_last_name: "Hamilton",
    # input_phone_number: "",
    # input_email: "alexander@forprez.com"
#   }
# )

# p response.body

# DELETE ACTION
p "What contact would you like delete?"
contact_id = gets.chomp.to_i
response = Unirest.delete("http://localhost:3000/api/contacts/#{contact_id}")
p response.body