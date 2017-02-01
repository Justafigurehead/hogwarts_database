require('sinatra')
require('sinatra/contrib/all')
require_relative('./models/Student')
require_relative('./models/House')

# Home page
get "/" do 

redirect to ("/students")
end
   
#Show all students
get "/students" do
  @students = Student.all
  erb(:index)
end

#Load form to create new student
get "/students/new" do
  @houses = House.all
  erb(:new)
end

#Submit form for new student
post "/students" do
  @student = Student.new(params)
  @student.save()
  redirect to ("/students/#{@student.id}")
end

#show pizza by id
get "/students/:id" do
     @student = Student.find(params[:id])
     erb(:show)
end

#destroy an entry of a student
post "/students/:id/destroy" do
  Student.destroy(params[:id])
  redirect to ("/students")
end

#request form to update

get "/students/:id/edit" do
      @student = Student.find(params[:id])
      @houses = House.all
      erb (:edit)
end

#send updated form
post "/students/:id" do
      @student = Student.update(params)
      redirect to ("/students/#{params[:id]}")
end