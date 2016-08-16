require('pry-byebug')
require_relative('../models/athlete.rb')
require_relative('../models/event.rb')
require_relative('../models/nation.rb')
require_relative('../models/participation.rb')

Athlete.delete_all()
Event.delete_all()
Nation.delete_all()

nation1 = Nation.new({
    'name' => 'Great Britain'
  })
nation2 = Nation.new({
    'name' => 'Jamaica'
  })
nation3 = Nation.new({
    'name' => 'Uganda'
  })

nation1.save
nation2.save
nation3.save

athlete1 = Athlete.new({ 
    'first_name' => 'Usian', 
    'last_name' => 'Bolt', 
    'gender' => 'male',
    'nation_id' => nation2.id
    })

athlete2 = Athlete.new({ 
    'first_name' => 'Andrew', 
    'last_name' => 'Buchart', 
    'gender' => 'male',
    'nation_id' => nation1.id
    })

athlete3 = Athlete.new({ 
    'first_name' => 'Adam', 
    'last_name' => 'Gemili', 
    'gender' => 'male',
    'nation_id' => nation1.id
    })

athlete4 = Athlete.new({ 
    'first_name' => 'Andy', 
    'last_name' => 'Murray', 
    'gender' => 'male',
    'nation_id' => nation1.id
   })

athlete5 = Athlete.new({ 
    'first_name' => 'Max', 
    'last_name' => 'Whitlock', 
    'gender' => 'male',
    'nation_id' => nation1.id
    })

athlete1.save
athlete2.save
athlete3.save
athlete4.save
athlete5.save

event1 = Event.new({ 
  'sport' => 'Gymnastics', 
  'gold_id' => athlete1.id, 
  'silver_id' => athlete2.id, 
  'bronze_id' => athlete3.id
  })

event2 = Event.new({ 
  'sport' => 'Tennis', 
  'gold_id' => athlete3.id, 
  'silver_id' => athlete4.id, 
  'bronze_id' => athlete5.id
  })

event3 = Event.new({ 
  'sport' => '100m Sprint', 
  'gold_id' => athlete1.id, 
  'silver_id' => athlete3.id, 
  'bronze_id' => athlete5.id
  })

event1.save
event2.save
event3.save

participation1 = Participation.new({
    'event_id' => event1.id,
    'athlete_id' => athlete1.id, 
})

participation2 = Participation.new({
    'event_id' => event1.id,
    'athlete_id' => athlete2.id, 
})

participation3 = Participation.new({
    'event_id' => event3.id,
    'athlete_id' => athlete4.id, 
})

participation4 = Participation.new({
    'event_id' => event3.id,
    'athlete_id' => athlete5.id, 
})

participation1.save
participation2.save
participation3.save
participation4.save

binding.pry
nil