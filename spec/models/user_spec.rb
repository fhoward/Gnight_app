require 'rails_helper'

RSpec.describe User, type: :model do
  
  before(:all) do
    @user = create(:user)
  end

  it "is valid with valid attributes" do
    expect(@user).to be_valid
  end

  it "has a unique name" do
    user = build(:user, name: "FrankJoe")
    expect(user).to_not be_valid
  end

  it "is not valid without a name" do 
    user = build(:user, name: nil)
    expect(user).to_not be_valid
  end

end
