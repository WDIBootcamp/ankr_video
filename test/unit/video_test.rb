# == Schema Information
#
# Table name: videos
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :string(255)
#  yt_video_id :string(255)
#  is_complete :boolean          default(FALSE)
#  created_at  :datetime
#  updated_at  :datetime
#

require 'test_helper'

class VideoTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
