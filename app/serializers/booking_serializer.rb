# app/serializers/booking_serializer.rb
class BookingSerializer < ActiveModel::Serializer
  attributes :id, :user_email, :user_name, :booking_time
  belongs_to :service
end