# == Schema Information
#
# Table name: chefs
#
#  id              :integer          not null, primary key
#  chefname        :string(255)
#  email           :string(255)
#  password_digest :string(255)
#  admin           :boolean          default(FALSE)
#  created_at      :datetime
#  updated_at      :datetime
#

class Chef < ActiveRecord::Base
before_save {self.email=email.downcase}

has_many :recipes
has_many :likes, dependent: :destroy

#email_regex = /\A[\W+\-.]+@ [a-z\d\-.]+\.[a-z]+\z/i
validates :chefname, presence: true, length: {maximum: 25, minimum: 5}
validates :email, presence: true, length: {maximum: 25}, uniqueness: {case_sensitive:false}
mount_uploader :picture, PictureUploader
validate :picture_size
has_secure_password	

private
def picture_size
	if picture.size > 5.megabyte
		errors.add(:picture, "should be less than 5MB")
	end
end
end
