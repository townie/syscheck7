require 'spec_helper'

describe Building do
  it { should validate_presence_of(:street_address) }
  it { should have_valid(:street_address).when('4 stuff st') }
  it { should_not have_valid(:street_address).when('', nil) }


  it { should validate_presence_of(:city) }
  it { should have_valid(:city).when('Boston', "New York City") }
  it { should_not have_valid(:city).when('', nil, "1Boston") }

  it { should validate_presence_of(:state) }
  it { should have_valid(:state).when('MA', "Ny", "mA", "ma") }
  it { should_not have_valid(:state).when('', nil, "MASSSSSSS", "1ab") }

  it { should validate_presence_of(:postal_code) }
  it { should have_valid(:postal_code).when('02129') }
  it { should_not have_valid(:postal_code).when('', nil) }
end
