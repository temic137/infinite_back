# app/controllers/api/v1/services_controller.rb
module Api
  module V1
    class ServicesController < ApplicationController
      def index
        services = Service.all
        render json: services.map { |service|
        if service.image.attached?
          service.as_json.merge(image_url: url_for(service.image))
        else
          service.as_json.merge(image_url: nil)  # or a placeholder URL if desired
        end
      }
      end

      def show
        service = Service.find(params[:id])
        render json: service
      rescue ActiveRecord::RecordNotFound
        render json: { error: 'Service not found' }, status: :not_found
      end

      def create
        service = Service.new(service_params)
        if service.save
          render json: service, status: :created
        else
          render json: { errors: service.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def service_params
        params.require(:service).permit(:name, :description, :duration, :price)
      end
    end
  end
end