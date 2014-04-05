class Owner < ActiveRecord::Base
  has_many :buildings

  validates :first_name,    presence: true,   format: {with: /^[a-zA-Z]+$/, :multiline => true, message: "Please enter a valid first name"}
  validates :last_name,     presence: true,   format: {with: /^[a-zA-Z]+$/, :multiline => true, message: "Please enter a valid last name"}
  validates :email,         presence: true ,  :email => true

  def clean_up_buildings
    Building.where("owner_id = ?", id).update_all(:owner_id => nil)
  end

  def full_name
    first_name << " " << last_name
  end
end
