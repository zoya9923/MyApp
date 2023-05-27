class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content, :commentable_id, :commentable_type
 # belongs_to :post, class_name: 'ProfModule::Post'
  belongs_to :event
 # belongs_to :forum
end
