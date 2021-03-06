require 'spec_helper'

describe Owner do

  it { should have_many(:buildings)}

  it { should validate_presence_of(:first_name) }
  it { should have_valid(:first_name).when('Keith') }
  it { should_not have_valid(:first_name).when('', nil, '12keith') }


  it { should validate_presence_of(:last_name) }
  it { should have_valid(:last_name).when('Webber', "webber") }
  it { should_not have_valid(:last_name).when('', nil, "1Boston") }

  it { should validate_presence_of(:email) }
  it { should have_valid(:email).when('MA@gmail.com', "Ny12_12@gmail.com", "12gstuff@me.com", "asd2.lakjsh@google.co") }
  it { should_not have_valid(:email).when('', nil, "@gmail.com", "@", "terrbile@gmail") }

  it "has a method to return full name" do
    owner = Owner.create({ first_name: "Keith", last_name: "Webber", email: "stuff@gmail.com" })

    expect(owner.full_name).to eq("Keith Webber")

  end

end
