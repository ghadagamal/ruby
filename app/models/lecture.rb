class Lecture < ActiveRecord::Base
validates :attach, :presence =>true
  belongs_to :course
 has_many :comments ,:dependent => :destroy
mount_uploader :attach, ImageUploader
  acts_as_votable 

end
