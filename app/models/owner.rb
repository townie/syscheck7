class Owner < ActiveRecord::Base
  validates :first_name,    presence: true,   format: {with: /^[a-zA-Z]+$/, :multiline => true, message: "Please enter a valid first name"}
  validates :last_name,     presence: true,   format: {with: /^[a-zA-Z]+$/, :multiline => true, message: "Please enter a valid last name"}
  validates :email,         presence: true ,  :email => true
end
