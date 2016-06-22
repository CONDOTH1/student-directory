
def student_input
puts "Please enter the name of students"
puts "To finish, just press enter twice"
name = gets.chomp
students = []
months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
while !name.empty? do
puts "Please enter the students cohort"
cohort = gets.chomp.to_sym
cohort = Time.now.strftime("%B") if cohort.empty?
until months.include?(cohort.capitalize)
  puts "Spelling error, please type cohort again!"
  cohort = gets.chomp
end
puts "Please enter the students hobbies"
hobbies = gets.chomp
hobbies = "undisclosed" if hobbies.empty?
puts "Please enter the students place of birth"
pob = gets.chomp
pob = "undisclosed" if pob.empty?
puts "Please enter the students height"
height = gets.chomp
height = "undisclosed" if height.empty?
  students << {name: name, cohort: cohort, hobbies: hobbies, pob: pob, height: height}
  puts "Now we have #{students.count} students"
  name = gets.chomp
end
students
end

def print_header
 puts "The students of Villains Academy".center(500)
 puts "-----------".center(500)
end

 def print(names)

#exercise 1, 2, & 3 completed in the below code block:
#names.each.with_index(1){|student, index| puts "#{index}: #{student[:name]} (#{student[:cohort]} cohort)" if student[:name].split('').shift == "H" && student[:name].length < 12}

#exercise 4 below:
int = 0
until int == names.count
puts "#{names[int][:name]} (#{names[int][:cohort]} cohort), Hobbies: #{names[int][:hobbies]}, Born: #{names[int][:pob]}, Height: #{names[int][:height]}".center(500)
int += 1
end
end

 def print_footer(names)
 puts  "Overall, we have #{names.count} great students".center(500)
end

students = student_input
print_header
print(students)
print_footer(students)
