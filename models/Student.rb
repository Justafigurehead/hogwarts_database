
require_relative("../db/sqlrunner")
require_relative("./House")

class Student 

attr_accessor :first_name, :last_name, :house_id, :age, :id
  def initialize(options)
    @first_name = options["first_name"]
    @last_name = options["last_name"]
    @house_id = options["house_id"].to_i
    @age = options["age"].to_i
    @id = options["id"].to_i
 
  end

  def save()
  sql = "INSERT INTO students (first_name, last_name, house_id, age) VALUES ('#{@first_name}', '#{@last_name}', '#{@house_id}', '#{@age}') RETURNING id;"
  student = SqlRunner.run( sql).first
  @id = student["id"].to_i
  end

  def self.update( options)
    sql = "UPDATE students SET
    first_name = '#{options['first_name']}',
    last_name = '#{options['last_name']}',
    house_id = #{options['house_id']},
    age = #{options['age']}
    WHERE id = #{options['id']}"

    SqlRunner.run(sql)
  end 

  def self.destroy(id)
    sql = "DELETE FROM students WHERE id =#{id};"
    SqlRunner.run( sql )
  end

  def self.all()
    sql = "SELECT * FROM students;"
    students = SqlRunner.run( sql )
    result = students.map {|student| Student.new(student)}
    return result 
  end

  def self.find(id)
    sql = "SELECT * FROM students WHERE id = #{id}"
    student = SqlRunner.run( sql )
    result = Student.new(student.first)
    return result
  end


  def student_name()
    return @first_name.concat("  #{@last_name}")
  end

  def house()
    sql = "SELECT * FROM houses WHERE id = #{@house_id}; "
    student_house = SqlRunner.run(sql).first

    result = House.new(student_house)
    return result
  end

end