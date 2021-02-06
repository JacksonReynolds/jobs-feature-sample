class JobSerializer < ActiveModel::Serializer
  attributes :id, :title, :skills, :description
end
