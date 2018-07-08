class Contact < ApplicationRecord
  def month_day_year #to display formatted update at
    updated_at.strftime("%B %e, %Y")
  end

  def full_name
    #string first and last name
    "#{first_name} #{last_name}"
  end

  def japan_country_code #will add +81 in front of phone number"
    "+81 #{phone_number}"
  end
end
