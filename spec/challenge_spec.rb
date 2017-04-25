require 'rails_helper'

describe Challenge do

  it "has a valid factory" do
    expect(FactoryGirl.build(:challenge)).to be_valid
  end

  describe "validity without existence of an attribute" do
    it "is invalid without content" do
      expect(FactoryGirl.build(:challenge, description: nil)).not_to be_valid
    end
  end

end
