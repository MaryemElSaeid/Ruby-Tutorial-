class ArticleSerializer < ActiveModel::Serializer
  attributes :id 
  attributes :title
  attributes :text
end
