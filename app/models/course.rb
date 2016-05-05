class Course < ActiveRecord::Base
  belongs_to :user
  has_many :lectures,:dependent => :destroy
  validates :title, :presence =>true
 
end
