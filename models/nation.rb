#require related files
#create class for nation
#develop CRUD functions within class

require('pg')
require_relative('../db/sql_runner')
require_relative('./event.rb')
require_relative('./athlete.rb')

class Nation

  attr_reader :id, :nation

  def initialize(options)
    @id = options['id'].to_i
    @nation = options['nation']
  end

  def save()
    sql = "INSERT INTO nations (nation) VALUES ('#{@nation}') RETURNING *"
    event = SqlRunner.run(sql).first
    @id = event['id']
  end

  def athletes()
    sql ="SELECT n.* FROM nations n INNER JOIN athletes a ON n.id = a.athlete_id WHERE n.nation_id = #{@id}" #this is wrong i think!
    return Nation.map_items(sql)
  end

  def self.all()
    sql = "SELECT * FROM nations"
    return Nation.map_items(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM nations WHERE id = #{id}"
    return Nation.map_item(sql)
  end

  def self.delete_all()
    sql = "DELETE FROM nations"
    SqlRunner.run(sql)
  end
  
  def self.map_items(sql)
    event = SqlRunner.run(sql)
    result = nation.map { |n| Nation.new( n ) }
    return result
  end

  def self.map_item(sql)
    result = Nation.map_items(sql)
    return result.first
  end

end