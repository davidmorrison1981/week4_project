#database seed data will be stored in here

require('pry-byebug')
require_relative('../models/athlete.rb')
require_relative('../models/event.rb')
require_relative('../models/nation.rb')

Athlete.delete_all()
Event.delete_all()
Nation.delete_all()


athlete1 = Athlete.new({ 'first_name' => 'Usian', 'lastname' => 'Bolt', 'gender' => 'male'})
athlete2 = Athlete.new({ 'first_name' => 'Andrew', 'lastname' => 'Buchart', 'gender' => 'male'})
athlete3 = Athlete.new({ 'first_name' => 'Adam', 'lastname' => 'Gemili', 'gender' => 'male'})
athlete4 = Athlete.new({ 'first_name' => 'Andy', 'lastname' => 'Murray', 'gender' => 'male'})
athlete5 = Athlete.new({ 'first_name' => 'Max', 'lastname' => 'Whitlock', 'gender' => 'male'})

athlete1.save
athlete2.save
athlete3.save
athlete4.save
athlete5.save


event1 = Event.new({ 'sport' => 'Gymnastics', 'gold_id' => 'athlete1.id', 'silver_id' => 'athlete2.id', 'bronze_id' => 'athlete3.id'})
event2 = Event.new({ 'sport' => 'Tennis', 'gold_id' => 'athlete3.id', 'silver_id' => 'athlete4.id', 'bronze_id' => 'athlete5.id'})
event3 = Event.new({ 'sport' => '100m Sprint', 'gold_id' => 'athlete1.id', 'silver_id' => 'athlete3.id', 'bronze_id' => 'athlete5.id'})


event1.save
event2.save
event3.save
event4.save
event5.save


rental1 = Rental.new({'book_id' => book1.id, 'member_id' => member1.id})
rental2 = Rental.new({'book_id' => book2.id, 'member_id' => member1.id})
rental3 = Rental.new({'book_id' => book3.id, 'member_id' => member2.id})
rental4 = Rental.new({'book_id' => book4.id, 'member_id' => member1.id})
rental5 = Rental.new({'book_id' => book5.id, 'member_id' => member2.id})
rental6 = Rental.new({'book_id' => book3.id, 'member_id' => member3.id})
rental7 = Rental.new({'book_id' => book2.id, 'member_id' => member5.id})
rental8 = Rental.new({'book_id' => book4.id, 'member_id' => member5.id})

rental1.save
rental2.save
rental3.save
rental4.save
rental5.save
rental6.save
rental7.save
rental8.save

binding.pry
nil