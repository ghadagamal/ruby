
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
mount_uploader :attachment, AttachmentUploader
has_many :courses,:dependent => :destroy
#has_many :likes,:dependent => :destroy
has_many:comments,:dependent => :destroy
#has_many :lectures,:dependent => :destroy
validates :name, :presence =>true
end
