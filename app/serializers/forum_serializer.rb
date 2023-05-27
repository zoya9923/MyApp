class ForumSerializer < ActiveModel::Serializer
  attributes :id, :forum_title, :forum_name
  has_many :comments
end
