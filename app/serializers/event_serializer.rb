class EventSerializer < ActiveModel::Serializer
  attributes :id, :event_date, :event_description, :event_name, :event_time, :restaurant_id, :event_image, :max_seats, :status, :event_type, :city, :price
end
