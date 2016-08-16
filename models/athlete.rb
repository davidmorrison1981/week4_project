#require related files
#create class for athlete
#develop CRUD functions within class
require('pg')
require_relative('../db/sql_runner')
require_relative('./nation.rb')
require_relative('./event.rb')

class Athlete

  attr_reader :id, :first_name, :last_name, :gender

  def initialize(options)
    @id = options['id'].to_i
    @first_name = options['first_name']
    @last_name = options['last_name']
    @gender = options['gender']
    @nation_id = options['nation_id'].to_i
  end

  def full_name()
    return @first_name.concat(" #{@last_name}")
  end

  def save()
    sql = "INSERT INTO athletes (first_name, last_name, gender, nation_id) VALUES ('#{@first_name}', '#{@last_name}', '#{@gender}', '#{@nation_id}' ) RETURNING *"
    athlete = SqlRunner.run(sql).first
    @id = athlete['id']
  end

  def events()
    sql ="SELECT e.* FROM events e INNER JOIN participation p ON e.id = p.event_id WHERE p.athlete_id = #{@id}"
    return Event.map_items(sql)
  end

  def self.all()
    sql = "SELECT * FROM athletes"
    return Athlete.map_items(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM athletes WHERE id = #{id}"
    return Athlete.map_item(sql)
  end

  def self.delete_all()
    sql = "DELETE FROM athletes"
    SqlRunner.run(sql)
  end


  def self.map_items(sql)
    athlete = SqlRunner.run(sql)
    athlete = athlete.map { |a| Athlete.new( a ) }
    return athlete
  end

  def self.map_item(sql)
    result = Athlete.map_items(sql)
    return result.first
  end

end
