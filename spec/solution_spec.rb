require 'rails_helper'

describe Solution do

  it "has a valid factory" do
    expect(FactoryGirl.build(:solution)).to be_valid
  end

  describe "validity without existence of an attribute" do
    it "is invalid without a title" do
      expect(FactoryGirl.build(:solution, title: nil)).not_to be_valid
    end
    it "is invalid without description" do
      expect(FactoryGirl.build(:solution, description: nil)).not_to be_valid
    end
  end
end
