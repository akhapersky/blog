class Post < ApplicationRecord
  #add validation
  # def initalize
  #   title = "title!!!"
  #   dody = "body"
  # end
  has_many :comments, dependent: :destroy
  validates :title, presence: true, length: {minimum: 5}  # called automatically
end
