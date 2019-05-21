class Post < ApplicationRecord
  belongs_to :user

  validates :title, :content, presence: true
  validates :content, length: { minimum: 250 }
end
