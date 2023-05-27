class EventSerializer < ActiveModel::Serializer
  attributes :id , :event_title, :date
  has_many :comments
end
