class Chef < ActiveRecord::Base
before_save {self.email=email.downcase}

has_many :recipes

#email_regex = /\A[\W+\-.]+@ [a-z\d\-.]+\.[a-z]+\z/i
validates :chefname, presence: true, length: {maximum: 25, minimum: 5}
validates :email, presence: true, length: {maximum: 25}, uniqueness: {case_sensitive:false}
has_secure_password
	
end