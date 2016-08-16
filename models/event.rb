#require related files
#create class for event
#develop CRUD functions within class

require('pg')
require_relative('../db/sql_runner')
require_relative('./nation.rb')
require_relative('./athlete.rb')

class Event

  attr_reader :id, :sport, :gold_id, :silver_id, :bronze_id

  def initialize(options)
    @id = options['id'].to_i
    @sport = options['sport']
    @gold_id = options['gold_id']
    @silver_id = options['silver_id']
    @bronze_id = options['bronze_id']
  end

  def save()
    sql = "INSERT INTO events (sport, gold_id, silver_id,bronze_id) VALUES ('#{@sport}', '#{@gold_id}', '#{@silver_id}', '#{@bronze_id}' ) RETURNING *"
    event = SqlRunner.run(sql).first
    @id = event['id']
  end

  def athletes()
    sql ="SELECT a.* FROM athletes a INNER JOIN participation p ON a.id = p.athlete_id WHERE p.event_id = #{@id}"
    return Athlete.map_items(sql)
  end

  def self.all()
    sql = "SELECT * FROM events"
    return Event.map_items(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM events WHERE id=#{id}"
    return Event.map_item(sql)
  end

  def self.delete_all()
    sql = "DELETE FROM events"
    SqlRunner.run(sql)
  end
  
  def self.map_items(sql)
    event = SqlRunner.run(sql)
    result = event.map { |e| Event.new( e ) }
    return result
  end

  def self.map_item(sql)
    result = Event.map_items(sql)
    return result.first
  end

  def return_gold
    sql= "SELECT a.* FROM athletes a INNER JOIN events e ON a.id = e.athlete_id WHERE .gold_id = #{@gold_id}"
    gold_medal = Athlete.map_items(sql)
    return gold_medal
  end


end
