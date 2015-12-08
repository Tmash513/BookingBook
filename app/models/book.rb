class Book < ActiveRecord::Base
  belongs_to :user
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
end
