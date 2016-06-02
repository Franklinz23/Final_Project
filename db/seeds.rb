require 'ffaker'


Teacher.destroy_all
Family.destroy_all
Student.destroy_all

admin = Teacher.create({
  email: "admin@aol.com",
  password: "boomin"
  })

puts "Seeded the admin account with id #{admin.id}"

puts "-----------"

teachers = []

5.times do
  teachers << {
    f_name: FFaker::Name.first_name,
    l_name: FFaker::Name.last_name,
    email: FFaker::Internet.safe_email,
    password: "boomin"
  }
end

t = Teacher.create(teachers)
puts "Seeded #{t.count} teachers"

puts "--------------"

families = []

10.times do
  families << {
    f_name: FFaker::Name.first_name,
    l_name: FFaker::Name.last_name,
    email: FFaker::Internet.safe_email,
    password: "boomin"
  }
end

f = Family.create(families)
puts "Seeded #{f.count} families"

puts "--------------"

allTeachers = Teacher.all

allTeachers.each do |teacher|
  20.times do
    teacher.students.push(
    Student.create({
      f_name: FFaker::Name.first_name,
      l_name: FFaker::Name.last_name,
      grade: "Meeting",
      notes: FFaker::DizzleIpsum.phrases
      })
    )
  end
end

puts "Teachers have Students"
