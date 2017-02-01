require_relative('../db/sqlrunner')
class House

attr_accessor :house_name
attr_reader :id
 
  def initialize(options)
    @house_name = options['house_name']
    @id = options['id'].to_i
  end

   def save()
   sql = "INSERT INTO houses (house_name) VALUES ('#{@house_name}') RETURNING id;"
   house = SqlRunner.run( sql).first
   @id = house["id"].to_i
   end

   def self.update( options)
     sql = "UPDATE houses SET
     house_name = '#{options['house_name']}'
     WHERE id = '#{optons['id']}'"

     SqlRunner.run(sql)
   end 

   def self.destroy(id)
     sql = "DELETE FROM houses WHERE id =#{id};"
     SqlRunner.run( sql )
   end

   def self.all()
     sql = "SELECT * FROM houses;"
     houses = SqlRunner.run( sql )
     result = houses.map {|house| House.new(house)}
     return result 
   end

   def self.find(id)
     sql = "SELECT * FROM houses WHERE id = #{id}"
     house = SqlRunner.run( sql )
     result = House.new(house.first)
     return result
   end


end