require 'rails_helper'

describe Project do

  it "has a valid factory" do
    expect(FactoryGirl.build(:project)).to be_valid
  end

  describe "validity without existence of an attribute" do
    it "is invalid without a title" do
      expect(FactoryGirl.build(:project, title: nil)).not_to be_valid
    end
    it "is invalid without description" do
      expect(FactoryGirl.build(:project, description: nil)).not_to be_valid
    end
  end
end
