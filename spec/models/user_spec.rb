require 'rails_helper'

RSpec.describe User, type: :model do
  describe "#full_description" do
    it 'should display name and email' do

    user = User.new(name:"Jonathan", email:"jonathan23127821@gmail.com", password:"123456789")

    res = user.full_description

    expect(res).to eq("Jonathan - jonathan23127821@gmail.com")
    end
  end
end
