# app/serializers/service_serializer.rb
class ServiceSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :duration, :price
end