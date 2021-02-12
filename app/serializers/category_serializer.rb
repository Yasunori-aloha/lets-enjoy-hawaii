class CategorySerializer < ActiveModel::Serializer
  attributes :id,
             :name,
             :search

  def id
    object[:id]
  end

  def name
    object[:name]
  end

  def search
    object[:search]
  end

end
