class Comment < ApplicationRecord

  belongs_to :user
  belongs_to :article

  validates :body, presence: true
  validates :user, presence: true
  validates :article, presence: true

end
