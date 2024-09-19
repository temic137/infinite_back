class Booking < ApplicationRecord
  belongs_to :service
  validates:user_name, presence:true
  validates:user_email, presence:true 
end 
