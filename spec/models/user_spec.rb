require 'rails_helper'

RSpec.describe User, type: :model do
  context "when email is blank or invalid" do

    it "is not valid" do
      @user = FactoryGirl.build(:user, email: "")
      expect(@user).to_not be_valid
    end

    it "is not valid" do
      @user = FactoryGirl.build(:user, email: "useremail")
      expect(@user).to_not be_valid
    end

  end
end
