require 'test_helper'

class LectureTest < ActiveSupport::TestCase
   test "the truth" do
     assert Lecture.all.size==1
   end
end
