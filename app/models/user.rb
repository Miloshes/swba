class User < ActiveRecord::Base
  belongs_to :role
  
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :full_name, :presence => true, :length => { :maximum => 20 }
  validates :email, :presence => true, :format => { :with => email_regex }, :uniqueness => { :case_sensitive => false}
  
  scope :observers, where(:role_id => 2)
end