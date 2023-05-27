class PostSerializer < ActiveModel::Serializer
  attributes :id, :post_title, :description
  has_many :comments
end
