#create a sqlrunner class the uses the pg gem to connect to the database rio_2016
#use the db.exec to run the sql statements from the models
require( 'pg')

class SqlRunner

  def self.run( sql )
    begin
      db = PG.connect({ dbname: 'rio2016', host: 'localhost' })
      result = db.exec( sql )
    ensure
      db.close
    end
    return result
  end

end
