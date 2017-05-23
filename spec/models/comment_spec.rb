require 'rails_helper'

RSpec.describe Comment, type: :model do

  context "when required fields are not present" do

    it "is not valid without an article" do
      @comment = FactoryGirl.build(:comment, article_id: "")
      expect(@comment).not_to be_valid
    end

    it "is not valid without a user" do
      @comment = FactoryGirl.build(:comment, user_id: "")
      expect(@comment).not_to be_valid
    end

    it "is not valid without a body" do
      @comment = FactoryGirl.build(:comment, body: "")
      expect(@comment).not_to be_valid
    end

  end
end
