require 'pry'
class Dog 
  attr_accessor :name, :breed, :id
  def initialize(id: nil, name:, breed:)
    @name = name
    @breed = breed
    @id = id
  end
  def self.create_table
    sql = <<-SQL
      CREATE TABLE dogs (
        id INTEGER PRIMARY KEY,
        name TEXT,
        breed, TEXT)
    SQL
    DB[:conn].execute(sql)
  end
  def self.drop_table
    sql = <<-SQL
      DROP TABLE dogs
    SQL
    DB[:conn].execute(sql)
  end
  def save
    sql = <<-SQL
      INSERT INTO dogs (name, breed)
      VALUES (?, ?)
    SQL
    answer  = DB[:conn].execute(sql, self.name, self.breed)
    #binding.pry
    @id = DB[:conn].execute("SELECT last_insert_rowid() FROM dogs")[0][0]
    self
  end
end