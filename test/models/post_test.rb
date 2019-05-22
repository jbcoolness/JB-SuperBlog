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

require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
