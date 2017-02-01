require_relative('../models/Student')
require_relative('../models/House')
require ('pry-byebug')

house1 = House.new("house_name" => "Gryffindor")
house2 = House.new("house_name" => "Slytherin")
house3 = House.new("house_name" => "Hufflepuff")
house4 = House.new("house_name" => "Ravenclaw")
house5 = House.new("house_name" => "New house")
house1.save
house2.save
house3.save
house4.save


student1 = Student.new({
"first_name" => "Arlene ",
"last_name" => "McDaid",
"house_id" => 4,
"age" => 10
  })

student2 = Student.new({
  "first_name" => "Michaela ",
  "last_name" => "Strachan",
  "house_id" => 4,
  "age" => 12
  })

student1.save
student2.save 

