require_relative('./athlete')
require_relative('./event')

class Participation
  attr_reader :id, :event_id, :athlete_id

  def initialize(options)
    @id = options['id'].to_i
    @event_id = options['event_id'].to_i
    @athlete_id = options['athlete_id'].to_i
  end

  def save()
    sql = "INSERT INTO participation (event_id, athlete_id) VALUES ('#{@event_id}', '#{@athlete_id}') RETURNING *"
    participation = SqlRunner.run(sql).first
    @id = participation['id']
  end

  def self.all()
    sql = "SELECT * FROM participation"
    self.map_items(sql)
  end

  def self.map_items(sql)
    participations = SqlRunner.run(sql)
    result = participations.map { |e| Participation.new( e ) }
    return result
  end

end