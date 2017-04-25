require 'rails_helper'

describe User do
  it "has a valid factory" do
    expect(FactoryGirl.build(:user)).to be_valid
  end
  it "is invalid without an email" do
    expect(FactoryGirl.build(:user, email: nil)).not_to be_valid
  end
  it "is invalid without a password" do
    expect(FactoryGirl.build(:user, password: nil)).not_to be_valid
  end
  it "is invalid when email is already in use" do
    FactoryGirl.build(:user, email: "admin@admin.com").save!
    expect(FactoryGirl.build(:user, email: "admin@admin.com")).not_to be_valid
  end
end
