class Article < ApplicationRecord
  # Create method @article.comments for 
  # render the comments in article page
  has_many  :comments

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
end
