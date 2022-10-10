class PostSerializer < ActiveModel::Serializer
  #Serializar un objeto es convertirlo en una cadena de bytes con la idea de almacenarlo para su posterior uso o para su uso por otro programa o proceso
  attributes :id, title, content, pusblished, author

  def author
    user = self.object.user
    {
      name: user.name,
      email: user.email,
      id: user.id 
    }
  end
end
