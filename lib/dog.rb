class Dog 
  attr_accessor :name, :breed, :id
  def initialize(id: = nil, name: name_value, breed: breed_value)
    @name = name
    @breed = breed
    @id = id
  end
end