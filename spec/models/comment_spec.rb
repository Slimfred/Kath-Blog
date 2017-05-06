require 'rails_helper'

RSpec.describe Comment, type: :model do

  context "when required fields are not present" do

    it "is not valid without an article" do
      expect(Comment.new(user_id: 1, body: "nice comment")).not_to be_valid
    end

    it "is not valid without a user" do
      expect(Comment.new(article_id: 1, body: "nice comment")).not_to be_valid
    end

    it "is not valid without a body" do
      expect(Comment.new(user_id: 1, article_id: 1)).not_to be_valid
    end

  end
end
