require 'rails_helper'

describe Article do

  context "when required fields are not present" do

    it "is not valid without a title" do
      @article = FactoryGirl.build(:article, title: "")
      expect(@article).to_not be_valid
    end

    it "is not valid without a subject" do
      @article = FactoryGirl.build(:article, subject: "")
      expect(@article).to_not be_valid
    end

    it "is not valid without a body" do
      @article = FactoryGirl.build(:article, body: "")
      expect(@article).to_not be_valid
    end

  end
end
