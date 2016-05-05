require 'test_helper'

class CourseTest < ActiveSupport::TestCase
   test "one" do
     assert  assert Course.all.size==1
   end
end
