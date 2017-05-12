class Article < ApplicationRecord

  has_many :comments

  validates :title, presence: true
  validates :subject, presence: true
  validates :body, presence: true

  scope :updated_at_desc, -> {order(updated_at: :desc)}

  def self.search(search_term)
    Article.where("body LIKE ?", "%#{search_term}%")
  end

end
