module Api
  module V1
    class BookingsController < ApplicationController
      include ActionController::HttpAuthentication::Basic::ControllerMethods

      before_action :authenticate_admin, only: [:index, :destroy]
      
      def index
        bookings = Booking.includes(:service).all
        render json: bookings, include: :service
      end

      def create
        booking = Booking.new(booking_params)
        if booking.save
          render json: booking, status: :created
        else
          render json: { errors: booking.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        booking = Booking.find(params[:id])
        if booking.destroy
          head :no_content
        else
          render json: { errors: "Failed to cancel booking" }, status: :unprocessable_entity
        end
      end

      private

      def booking_params
        params.require(:booking).permit(:service_id, :user_email, :user_name, :booking_time)
      end

      def authenticate_admin
        authenticate_or_request_with_http_basic do |username, password|
          username == 'admin' && password == 'secretpassword'
        end
      end
    end
  end
end