class Article < ApplicationRecord

  has_many :comments

  validates :title, presence: true
  validates :subject, presence: true
  validates :body, presence: true

  scope :created_at_desc, -> {order(created_at: :desc)}

end