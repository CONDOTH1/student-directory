
def student_input
puts "Please enter the name of students"
puts "To finish, just press enter twice"
name = gets.gsub("\n", '')
students = []
cohort_by_months = []
months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
while !name.empty? do
puts "Please enter the student's cohort"
cohort = gets.gsub("\n", '')
cohort = Time.now.strftime("%B") if cohort.empty?
until months.include?(cohort.capitalize)
  puts "Spelling error, please type cohort again!"
  cohort = gets.gsub("\n", '')
end
puts "Please enter the students hobbies"
hobbies = gets.gsub("\n", '')
hobbies = "undisclosed" if hobbies.empty?
puts "Please enter the students place of birth"
pob = gets.gsub("\n", '')
pob = "undisclosed" if pob.empty?
puts "Please enter the students height"
height = gets.gsub("\n", '')
height = "undisclosed" if height.empty?
  students << {name: name, cohort: cohort, hobbies: hobbies, pob: pob, height: height}
  puts students.count > 1 ? "Now we have #{students.count} students" : "Now we have #{students.count} student"
  name = gets.gsub("\n", '')
end
x = 0
while x < months.count
students.map{|hash| cohort_by_months << hash if hash[:cohort] == months[x]}
x += 1
end
cohort_by_months
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
   puts names.count > 1 ? "Overall, we have #{names.count} great students".center(500) : "Overall, we have #{names.count} great student".center(500)
 #puts  "Overall, we have #{names.count} great students".center(500)
end

students = student_input
print_header
print(students)
print_footer(students)
