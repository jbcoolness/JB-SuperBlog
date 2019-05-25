# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  title      :string
#  image      :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  content    :text
#

class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :title, :content, presence: true
  validates :content, length: { minimum: 250 }
end
