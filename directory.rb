
def student_input
puts "Please enter the name of students"
puts "To finish, just press enter twice"
name = gets.chomp
students = []
while !name.empty? do
  students << {name: name, cohort: :november}
  puts "Now we have #{students.count} students"
  name = gets.chomp
end
students
end

def print_header
 puts "The students of Villains Academy"
 puts "-----------"
end

 def print(names)
 names.each.with_index(1){|student, index| puts "#{index}: #{student[:name]} (#{student[:cohort]} cohort)" if student[:name].split('').shift == "H"}
 end

 def print_footer(names)
 puts  "Overall, we have #{names.count} great students"
end

students = student_input
print_header
print(students)
print_footer(students)
