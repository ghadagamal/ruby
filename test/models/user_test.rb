require 'test_helper'

class UserTest < ActiveSupport::TestCase
   test " not valid user" do
     user = User.create(email: 'ghada_gamal92@hotmail.com', name: 'ghada')
     assert user.valid?, 'password cant be null'
    
   end

test " valid user" do
   
     assert User.all.size==1
    
   end

end
